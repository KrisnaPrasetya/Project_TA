import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/setting_menu/controller/setting_controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      init: SettingController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Homepage Menu'),
          ),
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.red),
                child: Text("hello 1"),
              )
            ],
          ),
        );
      },
    );
  }
}
