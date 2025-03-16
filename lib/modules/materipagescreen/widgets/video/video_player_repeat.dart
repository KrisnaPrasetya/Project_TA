import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:get/get.dart';

// Video thumbnail that opens a popup player when tapped (no play icon)
class VideoThumbnail extends StatelessWidget {
  final String videoAsset; // Path to video file
  final String thumbnailAsset; // Path to thumbnail image
  final String label; // Optional label for the video
  final double playbackSpeed; // Video playback speed
  final double height; // Optional explicit height

  const VideoThumbnail({
    Key? key,
    required this.videoAsset,
    this.thumbnailAsset = '', // Optional thumbnail
    this.label = '', // Optional label
    this.playbackSpeed = 1.0,
    this.height = 150.0, // Default height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Show custom dialog with external close button
        showDialog(
          context: context,
          barrierDismissible: true,
          barrierColor: Colors.black.withOpacity(0.85),
          builder: (context) => ExternalButtonVideoPlayer(
            videoAsset: videoAsset,
            playbackSpeed: playbackSpeed,
          ),
        );
      },
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          fit: StackFit.expand, // Ensure Stack fills its container
          children: [
            // Thumbnail or placeholder
            if (thumbnailAsset.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  thumbnailAsset,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
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
            if (label.isNotEmpty)
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
                    label,
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
    );
  }
}

// Video player with external close button
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
