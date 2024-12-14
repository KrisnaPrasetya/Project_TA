import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/detailmateri/controller/detail_materi_controller.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailMateriController>(
      init: DetailMateriController(),
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.red),
                child: Text("Detail"),
              )
            ],
          ),
        );
      },
    );
  }
}
