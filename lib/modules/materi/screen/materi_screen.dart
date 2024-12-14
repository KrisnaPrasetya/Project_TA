import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/materi/controller/materi_controller.dart';
import 'package:project_ta/modules/materi/widgets/custom_header_materi.dart';

class MateriMenuScreen extends StatelessWidget {
  const MateriMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MateriController>(
      init: MateriController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeaderMateri(),
              Center(child: Text("materi")),
            ],
          ),
        );
        },
    );
  }
}
