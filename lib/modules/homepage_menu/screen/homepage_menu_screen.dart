import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/homepage_menu/controller/homepage_menu_controller.dart';

class HomepageMenuScreen extends StatelessWidget {
  const HomepageMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomepageMenuController>(
      init: HomepageMenuController(),
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
