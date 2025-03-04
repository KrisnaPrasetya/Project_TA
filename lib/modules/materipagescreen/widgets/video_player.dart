import 'package:flutter/material.dart';
import 'package:project_ta/modules/materipagescreen/widgets/fullscreenvideo.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String assetPath;

  const VideoPlayerWidget({Key? key, required this.assetPath}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.assetPath)
      ..initialize().then((_) {
        setState(() {});
      });

    _controller.addListener(() {
      setState(() {}); // Update UI setiap perubahan video
    });
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      _isPlaying = _controller.value.isPlaying;
    });
  }

  void _openFullScreen() async {
    final wasPlaying = _controller.value.isPlaying;
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenVideoPlayer(controller: _controller),
      ),
    );
    if (wasPlaying) {
      _controller.play(); // Melanjutkan video jika sebelumnya sedang diputar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    VideoPlayer(_controller),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
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
                    Positioned(
                      bottom: 40,
                      right: 10,
                      child: IconButton(
                        icon: Icon(Icons.fullscreen, color: Colors.white),
                        onPressed: _openFullScreen,
                      ),
                    ),
                    Positioned(
                      child: GestureDetector(
                        onTap: _togglePlayPause,
                        child: CircleAvatar(
                          backgroundColor: Colors.black54,
                          child: Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                height: 200,
                color: Colors.black,
                child: Center(child: CircularProgressIndicator()),
              ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
