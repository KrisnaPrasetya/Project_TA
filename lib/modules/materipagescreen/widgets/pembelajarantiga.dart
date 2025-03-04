import 'package:flutter/material.dart';
import 'package:project_ta/modules/materipagescreen/widgets/youtube_player.dart';

class Pembelajarantiga extends StatelessWidget {
  const Pembelajarantiga({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YoutubePlayerWidget(
          videoUrl: 'https://www.youtube.com/watch?v=vfp0r-lFm1k',
        ),
        SizedBox(height: 10),
        Text('Lokasi dan Koordinat '),
      ],
    );
  }
}
