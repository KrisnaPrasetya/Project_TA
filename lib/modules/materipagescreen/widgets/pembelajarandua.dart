import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/widgets/custom_container.dart';

class Pembelajarandua extends StatelessWidget {
  const Pembelajarandua({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainerButton(
      onTap: () {
        print('Container tapped!');
      },
      child: Text(
        'Click Me',
        style: TextStyle(
          fontSize: Get.width * 0.04,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      containerColor:
          Colors.white70, // Changed from 'color' to 'containerColor'
      borderColor: Colors.grey, // Add border color
      borderWidth: 2, // Customize border width
      enableAnimation: true, // Toggle animation on/off
      width: 200,
      height: 60,
    );
  }
}
