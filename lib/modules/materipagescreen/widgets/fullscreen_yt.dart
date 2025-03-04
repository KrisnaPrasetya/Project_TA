import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FullScreenPage extends StatelessWidget {
  final YoutubePlayerController controller;
  const FullScreenPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    // Set system UI to be completely immersive
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    
    return WillPopScope(
      onWillPop: () async {
        // Restore system UI when exiting fullscreen
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        // Remove any padding or safe areas
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          removeLeft: true,
          removeRight: true,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16/9,
                child: YoutubePlayer(
                  controller: controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blueAccent,
                  onEnded: (_) {
                    Navigator.pop(context);
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
                    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}