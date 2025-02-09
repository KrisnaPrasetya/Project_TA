import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/detailquiz/controller/quizdetail_controller.dart';
import 'package:project_ta/widgets/custom_button.dart';

class QuizQuestionWidget extends StatelessWidget {
  final QuizdetailController controller;

  const QuizQuestionWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final question =
          controller.questions[controller.currentQuestionIndex.value];
      return Column(
        children: [
          LinearProgressIndicator(
            value: controller.progress.value / 100,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(
              controller.progress.value >= 80
                  ? Colors.green
                  : controller.progress.value >= 50
                      ? Colors.amber
                      : Colors.amber[200]!,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Progress: ${controller.progress.value.toStringAsFixed(0)}%",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              question.question,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ...List.generate(
            question.options.length,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CustomButton(
                width: Get.width * 0.8,
                onPressed: controller.isAnswered.value
                    ? null
                    : () {
                        controller.answerQuestion(index);
                      },
                color: controller.isAnswered.value
                    ? index == question.correctAnswer
                        ? Colors.green
                        : Colors.red
                    : Colors.blue,
                child: Text(
                  question.options[index],
                  style: TextStyle(
                    fontSize: Get.width * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          if (controller.isAnswered.value) ...[
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                question.explanation,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ),
            CustomButton(
              width: Get.width * 0.8,
              color: Colors.green,
              onPressed: controller.currentQuestionIndex.value <
                      controller.questions.length - 1
                  ? () => controller.nextQuestion()
                  : () => Get.back(),
              child: Text(
                controller.currentQuestionIndex.value <
                        controller.questions.length - 1
                    ? "Pertanyaan Selanjutnya"
                    : "Selesai",
                style: TextStyle(
                  fontSize: Get.width * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ],
      );
    });
  }
}
