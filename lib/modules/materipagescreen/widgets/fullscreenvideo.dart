import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoPlayer extends StatefulWidget {
  final VideoPlayerController controller;

  const FullScreenVideoPlayer({Key? key, required this.controller})
      : super(key: key);

  @override
  _FullScreenVideoPlayerState createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  bool _showControls = true; // Untuk menampilkan atau menyembunyikan UI
  late Timer _hideTimer; // Timer untuk menyembunyikan kontrol

  @override
  void initState() {
    super.initState();
    _setLandscapeMode();
    _startHideTimer();
  }

  void _setLandscapeMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersiveSticky); // Sembunyikan status bar
  }

  void _setPortraitMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.edgeToEdge); // Tampilkan kembali status bar
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });

    if (_showControls) {
      _restartHideTimer(); // Reset timer jika user mengetuk layar
    }
  }

  void _startHideTimer() {
    _hideTimer = Timer(Duration(seconds: 3), () {
      setState(() {
        _showControls = false;
      });
    });
  }

  void _restartHideTimer() {
    _hideTimer.cancel();
    _startHideTimer();
  }

  @override
  void dispose() {
    _setPortraitMode();
    _hideTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: _toggleControls, // Klik layar untuk menampilkan/menghilangkan UI
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: widget.controller.value.aspectRatio,
              child: VideoPlayer(widget.controller),
            ),

            // Animasi Fade untuk Kontrol UI
            AnimatedOpacity(
              opacity: _showControls ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Container(
                color:
                    Colors.black.withOpacity(0.3), // Background semi transparan
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 130),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (widget.controller.value.isPlaying) {
                            widget.controller.pause();
                          } else {
                            widget.controller.play();
                          }
                        });
                        _restartHideTimer();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.black54,
                        radius: 30,
                        child: Icon(
                          widget.controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(height: 110),

                    // Progress bar
                    Row(
                      children: [
                        const SizedBox(width: 40),
                        Expanded(
                          child: VideoProgressIndicator(
                            widget.controller,
                            allowScrubbing: true,
                            colors: VideoProgressColors(
                              playedColor: Colors.red,
                              bufferedColor: Colors.grey,
                              backgroundColor: Colors.black,
                            ),
                          ),
                        ),

                        // Tombol Keluar Fullscreen
                        IconButton(
                          icon:
                              Icon(Icons.fullscreen_exit, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
