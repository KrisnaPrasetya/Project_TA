import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/detailquiz/controller/quizdetail_controller.dart';
import 'package:project_ta/modules/detailquiz/widgets/quizwidgets.dart';

class QuizdetailScreen extends StatelessWidget {
  const QuizdetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizdetailController>(
      init: QuizdetailController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: controller.materialId == 1
                ? Text('Kuis 1')
                : controller.materialId == 2
                    ? Text('Kuis 2')
                    : Text('Kuis 3'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () async {
                final bool confirmExit = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Batalkan Kuis?'),
                    content: Text('Progress tidak akan disimpan.'),
                    actions: [
                      TextButton(
                        onPressed: () => Get.back(result: false),
                        child: Text('Tidak'),
                      ),
                      TextButton(
                        onPressed: () => Get.back(result: true),
                        child: Text('Ya'),
                      ),
                    ],
                  ),
                );

                if (confirmExit == true) {
                  Get.back();
                }
              },
            ),
          ),
          backgroundColor: Colors.grey[100],
          body: SafeArea(
            child: QuizQuestionWidget(controller: controller),
          ),
        );
      },
    );
  }
}
