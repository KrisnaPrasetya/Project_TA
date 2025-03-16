import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_ta/modules/materipagescreen/widgets/video/fullscreenvideo.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String assetPath;

  const VideoPlayerWidget({Key? key, required this.assetPath})
      : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _showControls = true; // Untuk menampilkan atau menyembunyikan UI
  late Timer _hideTimer; // Timer untuk menyembunyikan kontrol

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.assetPath)
      ..initialize().then((_) {
        setState(() {});
      });

    _controller.addListener(() {
      setState(() {});
    });

    _startHideTimer();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      _isPlaying = _controller.value.isPlaying;
      _restartHideTimer(); // Reset timer agar UI menghilang setelah beberapa detik
    });
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

  void _openFullScreen() async {
  final wasPlaying = _controller.value.isPlaying;
  await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => FullScreenVideoPlayer(controller: _controller),
    ),
  );

  // Paksa rebuild UI setelah fullscreen ditutup
  setState(() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  });

  if (wasPlaying) {
    _controller.play(); // Lanjutkan video jika sebelumnya diputar
  }
}

  @override
  void dispose() {
    _controller.dispose();
    _hideTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleControls, // Menampilkan/Menyembunyikan UI saat diklik
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),

          // Kontrol UI dengan animasi fade
          AnimatedOpacity(
            opacity: _showControls ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child: Container(
              height: 217,
              color:
                  Colors.black.withOpacity(0.3), // Background semi transparan
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const  SizedBox(height: 64),

                  GestureDetector(
                    onTap: _togglePlayPause,
                    child: CircleAvatar(
                      backgroundColor: Colors.black54,
                      radius: 30,
                      child: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                const  SizedBox(height: 44),

                  // Progress bar
                  Row(
                    children: [
                      // Tombol fullscreen
                      SizedBox(width: 10),
                      Expanded(
                        child: VideoProgressIndicator(
                          _controller,
                          allowScrubbing: true,
                          colors: VideoProgressColors(
                            playedColor: Colors.red,
                            bufferedColor: Colors.grey,
                            backgroundColor: Colors.black,
                          ),
                        ),
                      ),

                      // Tombol fullscreen
                      IconButton(
                        icon: Icon(Icons.fullscreen, color: Colors.white),
                        onPressed: _openFullScreen,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
