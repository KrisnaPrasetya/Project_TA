import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/splash_screen/controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (controller) {
        return Center(
          child: Text(
            "HELOO",
            style: TextStyle(fontSize: 30),
          ),
        );
      },
    );
  }
}
