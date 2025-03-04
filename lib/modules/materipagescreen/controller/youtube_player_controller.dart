import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/materipagescreen/widgets/fullscreen_yt.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
    final isFullScreen = Get.isDialogOpen ?? false;
    
    if (isFullScreen) {
      Get.back();
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    } else {
      Get.dialog(
        FullScreenPage(controller: controller),
        barrierDismissible: false,
      );
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    controller.play();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}