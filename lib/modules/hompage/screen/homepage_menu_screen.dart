import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/hompage/controller/homepage_menu_controller.dart';
import 'package:project_ta/modules/hompage/widgets/custom_header.dart';
import 'package:project_ta/modules/hompage/widgets/menu_list%20item.dart';

class HomepageMenuScreen extends StatelessWidget {
  const HomepageMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomepageMenuController>(
      init: HomepageMenuController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              const CustomHeader(),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProgressItemList(
                        title: index == 0
                            ? "Materi Kubus dan Balok"
                            : "Segera hadir ... ",
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
