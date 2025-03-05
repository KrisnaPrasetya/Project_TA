import 'package:flutter/material.dart';
import 'package:project_ta/modules/materipagescreen/widgets/video_player.dart';

class Pembelajarantiga extends StatelessWidget {
  const Pembelajarantiga({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: VideoPlayerWidget(assetPath: "assets/videos/sample.mp4"),
          ),
        ),
        SizedBox(height: 10),
        Text('Lokasi dan Koordinat '),
      ],
    );
  }
}
