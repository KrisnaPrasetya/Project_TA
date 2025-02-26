import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/detailquiz/controller/quizdetail_controller.dart';

class CustomHeaderDetailQuiz extends StatelessWidget {
  final QuizdetailController controller;
  const CustomHeaderDetailQuiz({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.35,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFC100), Color(0xFFFFBE00)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: Get.height * 0.1,
            left: Get.width * 0.04,
            right: Get.width * 0.04,
            child: Container(
              padding: EdgeInsets.all(Get.width * 0.04),
              height: Get.height * 0.18,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Get.width * 0.03),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    final question = controller
                        .questions[controller.currentQuestionIndex.value];
                    return Text(
                      question.question,
                      style: TextStyle(
                        fontSize: Get.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
