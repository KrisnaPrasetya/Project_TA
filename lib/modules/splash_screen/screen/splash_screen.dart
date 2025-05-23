import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/splash_screen/controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (_) => AnnotatedRegion(
        value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(201, 15, 234, 223),
          body: Container(
            padding: const EdgeInsets.only(top: 80, bottom: 32),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                stops: [0, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF56FFB0),
                  Color(0xFF15D9C8),
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset( 
                    'assets/images/mascot.png',
                    width: 200,
                    height: 200,
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
