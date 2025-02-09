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
            title: controller.materialId == 1
                ? Text('Kuis 1')
                : controller.materialId == 2
                    ? Text('Kuis 2')
                    : Text('Kuis 3'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Get.back(),
            ),
          ),
          body: SafeArea(
            child: QuizQuestionWidget(controller: controller),
          ),
        );
      },
    );
  }
}
