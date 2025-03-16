import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/materipagescreen/controller/audio_controller.dart';

class AudioButton extends StatelessWidget {
  final int index;
  
  const AudioButton({Key? key, required this.index}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // Get the audio controller instance
    final AudioController audioController = Get.find<AudioController>();
    
    // Use GetBuilder to rebuild when audio state changes
    return GetBuilder<AudioController>(
      builder: (controller) {
        return Positioned(
          top: 8,
          right: 8,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                // Change icon based on playing state
                controller.isPlaying[index] 
                    ? Icons.volume_up 
                    : Icons.volume_off,
                color: controller.isPlaying[index] 
                    ? Colors.green 
                    : Colors.grey,
                size: 24,
              ),
              onPressed: () => controller.toggleAudio(index),
              padding: EdgeInsets.all(8),
              constraints: BoxConstraints(),
              splashRadius: 24,
            ),
          ),
        );
      },
    );
  }
}