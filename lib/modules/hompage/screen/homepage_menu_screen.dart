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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeader(),
              Container(
                color: Colors.green,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Riwayat belajar kamu...",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ProgressItemList(
                      title: "Materi Kubus dan Balok",
                      onTap: () {},
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
