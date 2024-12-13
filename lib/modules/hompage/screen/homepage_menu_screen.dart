import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      "Riwayat belajar kamu...",
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    SvgPicture.asset('assets/icons/sortby.svg')
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ProgressItemList(
                      title: "Materi Kubus dan Balok",
                      progress: 0.82,
                      subtitle: 'Terakhir dikerjakan pada 28 Desember 2024  ',
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
