import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// Controller untuk mengelola state guide menggunakan GetX
class VideoGuideController extends GetxController {
  // Map untuk menyimpan status guide untuk setiap video
  final Map<String, bool> _guideShownMap = {};

  // Cek apakah guide sudah ditampilkan untuk video tertentu
  bool isGuideShown(String videoId) {
    return _guideShownMap[videoId] ?? false;
  }

  // Tandai bahwa guide sudah ditampilkan untuk video tertentu
  void markGuideAsShown(String videoId) {
    _guideShownMap[videoId] = true;
    update(); // Trigger pembaruan UI
  }
}

// Video thumbnail that opens a popup player when tapped (no play icon)
class VideoThumbnail extends StatefulWidget {
  final String videoAsset; // Path to video file
  final String thumbnailAsset; // Path to thumbnail image
  final String label; // Optional label for the video
  final double playbackSpeed; // Video playback speed
  final double height; // Optional explicit height
  final bool showGuide; // Apakah menampilkan guide

  const VideoThumbnail({
    Key? key,
    required this.videoAsset,
    this.thumbnailAsset = '', // Optional thumbnail
    this.label = '', // Optional label
    this.playbackSpeed = 1.0,
    this.height = 150.0, // Default height
    this.showGuide = false, // Default tidak menampilkan guide
  }) : super(key: key);

  @override
  State<VideoThumbnail> createState() => _VideoThumbnailState();
}

class _VideoThumbnailState extends State<VideoThumbnail> {
  late VideoGuideController _guideController;
  bool _showGuide = false;

  @override
  void initState() {
    super.initState();
    // Lazy init controller jika belum ada
    _guideController = Get.put(VideoGuideController(), permanent: true);

    // Cek apakah perlu menampilkan guide
    if (widget.showGuide && !_guideController.isGuideShown(widget.videoAsset)) {
      // Tunda sebentar untuk memastikan widget sudah dirender dengan baik
      Future.delayed(Duration.zero, () {
        if (mounted) {
          setState(() {
            _showGuide = true;
          });
        }
      });
    }
  }

  void _hideGuide() {
    if (_showGuide) {
      setState(() {
        _showGuide = false;
      });
      _guideController.markGuideAsShown(widget.videoAsset);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Video thumbnail asli
        GestureDetector(
          onTap: () {
            // Jika guide tidak ditampilkan, langsung putar video
            if (!_showGuide) {
              showDialog(
                context: context,
                barrierDismissible: true,
                barrierColor: Colors.black.withOpacity(0.85),
                builder: (context) => ExternalButtonVideoPlayer(
                  videoAsset: widget.videoAsset,
                  playbackSpeed: widget.playbackSpeed,
                ),
              );
            }
          },
          child: Container(
            height: widget.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              fit: StackFit.expand, // Ensure Stack fills its container
              children: [
                // Thumbnail or placeholder
                if (widget.thumbnailAsset.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        widget.thumbnailAsset,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  )
                else
                  // Placeholder when no thumbnail is available
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.video_library,
                      color: Colors.white70,
                      size: 40,
                    ),
                  ),

                // Optional label at the bottom
                if (widget.label.isNotEmpty)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7)
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: Text(
                        widget.label,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),

        // Guide Overlay
        if (_showGuide)
          GestureDetector(
            onTap: () {
              _hideGuide();
              // Tunggu sedikit setelah guide hilang, baru tampilkan video player
              Future.delayed(Duration(milliseconds: 300), () {
                if (mounted) {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierColor: Colors.black.withOpacity(0.85),
                    builder: (context) => ExternalButtonVideoPlayer(
                      videoAsset: widget.videoAsset,
                      playbackSpeed: widget.playbackSpeed,
                    ),
                  );
                }
              });
            },
            child: Container(
              height: widget.height,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Lottie animation (optional)
                    if (Get.context != null) // Cek apakah Get.context tersedia
                      SizedBox(
                        height: 100,
                        width: 110,
                        child: Lottie.asset(
                          'assets/lottie/guide_click.json', // Ganti dengan path animasi Anda
                          fit: BoxFit.contain,
                        ),
                      )
                    else
                      Icon(
                        Icons.touch_app,
                        color: Colors.white,
                        size: widget.height * 0.3,
                      ),

                    SizedBox(height: 4),
                    Text(
                      'Ketuk untuk memutar video',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// Video player dengan external close button (Tidak dimodifikasi)
class ExternalButtonVideoPlayer extends StatefulWidget {
  final String videoAsset;
  final double playbackSpeed;

  const ExternalButtonVideoPlayer({
    Key? key,
    required this.videoAsset,
    this.playbackSpeed = 1.0,
  }) : super(key: key);

  @override
  State<ExternalButtonVideoPlayer> createState() =>
      _ExternalButtonVideoPlayerState();
}

class _ExternalButtonVideoPlayerState extends State<ExternalButtonVideoPlayer> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;
  bool _isPlaying = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.pause();
      _controller!.dispose();
    }
    super.dispose();
  }

  Future<void> _initializeController() async {
    try {
      _controller = VideoPlayerController.asset(widget.videoAsset);

      await _controller!.initialize();
      await _controller!.setPlaybackSpeed(widget.playbackSpeed);
      await _controller!.setLooping(true);

      if (mounted) {
        setState(() {
          _isInitialized = true;
        });

        // Auto-play when ready
        _controller!.play();
        setState(() {
          _isPlaying = true;
        });
      }
    } catch (e) {
      print("Error initializing video: $e");
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  void _togglePlayPause() {
    if (_controller == null || !_isInitialized) return;

    if (_controller!.value.isPlaying) {
      _controller!.pause();
      setState(() {
        _isPlaying = false;
      });
    } else {
      _controller!.play();
      setState(() {
        _isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use Stack to position close button outside the video container
    return Stack(
      children: [
        // Center video content
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              width: Get.width * 0.9, // 90% of screen width
              color: Colors.black,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: _isInitialized && _controller != null
                    ? GestureDetector(
                        onTap: _togglePlayPause,
                        child: VideoPlayer(_controller!),
                      )
                    : _hasError
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.error_outline,
                                    color: Colors.red, size: 48),
                                SizedBox(height: 16),
                                Text(
                                  "Error loading video",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        : Center(
                            child:
                                CircularProgressIndicator(color: Colors.white),
                          ),
              ),
            ),
          ),
        ),

        // External close button at top-right corner
        Positioned(
          top: 285,
          right: 5,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
