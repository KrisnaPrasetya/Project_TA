import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/firsttimeuser/controller/firsttime_user_controller.dart';
import 'package:project_ta/modules/firsttimeuser/widget/setup_avatar.dart';

class FirsttimeUserScreen extends StatelessWidget {
  const FirsttimeUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirstTimeUserController>(
      init: FirstTimeUserController(),
      builder: (controller) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            backgroundColor: const Color.fromARGB(201, 15, 234, 223),
            body: Container(
                width: Get.width,
                height: Get.height,
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
                child: SetupAvatarWidget(
                  controller: controller,
                )),
          ),
        );
      },
    );
  }
}
