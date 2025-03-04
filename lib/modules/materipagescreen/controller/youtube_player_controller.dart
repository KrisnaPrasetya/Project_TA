import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// Optimized FullScreenPage
class FullScreenPage extends StatelessWidget {
  final YoutubePlayerController controller;
  
  const FullScreenPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: AspectRatio(
              aspectRatio: orientation == Orientation.landscape ? 16/9 : 9/16,
              child: YoutubePlayer(
                controller: controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
                topActions: [
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Spacer(),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

// Optimized YoutubeController
class YoutubeController extends GetxController {
  late YoutubePlayerController controller;
  final String videoId;
  
  YoutubeController(this.videoId);

  @override
  void onInit() {
    super.onInit();
    controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: false,
        enableCaption: true,
      ),
    );
  }

  void toggleFullScreen(BuildContext context) {
    // Use Navigator instead of Get.dialog to reduce overhead
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FullScreenPage(controller: controller),
      ),
    ).then((_) {
      // Reset orientation when returning from fullscreen
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    });
    
    // Set landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void onClose() {
    controller.dispose();
    // Ensure portrait orientation is restored
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.onClose();
  }
}