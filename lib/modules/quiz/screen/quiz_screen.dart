import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/quiz/controller/quiz_controller.dart';
import 'package:project_ta/modules/quiz/widgets/custom_header_quiz.dart';
import 'package:project_ta/modules/quiz/widgets/kuis_items.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      init: QuizController(),
      builder: (controller) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            backgroundColor: Colors.grey[100],
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeaderQuiz(
                  controller: controller,
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.012),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFFFC100), Color(0xFFFFBE00)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(Get.width * 0.025),
                    ),
                    child: Center(
                      child: Text(
                        'Kuis Tersedia',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Get.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: controller.materials.length,
                    itemBuilder: (context, index) {
                      final material = controller.materials[index];
                      return KuisItems(material: material);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
