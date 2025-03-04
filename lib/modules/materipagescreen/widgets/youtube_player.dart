import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/materipagescreen/controller/youtube_player_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class YoutubePlayerWidget extends StatelessWidget {
  final String videoUrl;

  const YoutubePlayerWidget({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl) ?? '';
    final controller = Get.put(YoutubeController(videoId));

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller.controller,
        aspectRatio: 16 / 9,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        onReady: () => debugPrint('Ready'),
      ),
      builder: (context, player) => GestureDetector(
        onTap: () => controller.toggleFullScreen(context),
        child: player,
      ),
    );
  }
}