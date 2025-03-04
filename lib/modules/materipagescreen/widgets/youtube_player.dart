import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      },
      player: YoutubePlayer(
        controller: controller.controller,
        aspectRatio: 16 / 9,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        progressColors: const ProgressBarColors(
          playedColor: Colors.blueAccent,
          handleColor: Colors.blueAccent,
        ),
        onReady: () => debugPrint('Ready'),
        bottomActions: [
          CurrentPosition(),
          ProgressBar(isExpanded: true),
          RemainingDuration(),
          const PlaybackSpeedButton(),
          FullScreenButton(
            controller: controller.controller,
          ),
        ],
      ),
      builder: (context, player) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          player,
        ],
      ),
    );
  }
}
