import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/quiz/controller/quiz_controller.dart';

class MateriPageScreen extends StatelessWidget {
  const MateriPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int args = Get.arguments ?? 0;

    return GetBuilder<QuizController>(
      init: QuizController(),
      builder: (controller) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (args == 0)
                Center(child: Text('Pengertian Kubus dan Balok'))
              else if (args == 1)
                Center(
                    child: Text('Mengonstruksi dan Mengurai Kubus dan Balok'))
              else if (args == 2)
                Center(child: Text('Sifat-Sifat Kubus dan Balok'))
              else if (args == 3)
                Center(child: Text('Visualisasi Spasial'))
              else if (args == 4)
                Center(child: Text('Volume dan Luas Permukaan'))
              else if (args == 5)
                Center(child: Text('Lokasi dan Koordinat'))
              else
                Center(child: Text('Materi Tidak Ditemukan'))
            ],
          ),
        );
      },
    );
  }
}
