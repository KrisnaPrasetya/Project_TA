import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/detailquiz/controller/quizdetail_controller.dart';
import 'package:project_ta/modules/detailquiz/widgets/quizwidgets.dart';
import 'package:project_ta/modules/quiz/controller/quiz_controller.dart';
import 'package:project_ta/widgets/custom_button.dart';

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
                    title: Text(
                      'Apakah ingin kembali ?',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    content: Text(
                      'Jika kamu kembali progress tidak akan disimpan.',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            width: 120,
                            height: 45,
                            onPressed: () => Get.back(result: false),
                            color: Colors.green,
                            child: Text(
                              'Tidak',
                              style: TextStyle(
                                fontSize: Get.width * 0.04,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          CustomButton(
                            width: 120,
                            height: 45,
                            onPressed: () async {
                              await Get.find<QuizController>()
                                  .refreshQuizPage();
                              Get.back(result: true);
                            },
                            color: Colors.red,
                            child: Text(
                              'Ya',
                              style: TextStyle(
                                fontSize: Get.width * 0.04,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
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
