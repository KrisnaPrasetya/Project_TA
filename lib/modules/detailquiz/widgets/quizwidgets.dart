import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_ta/modules/detailquiz/controller/quizdetail_controller.dart';
import 'package:project_ta/widgets/custom_button.dart';
import 'package:project_ta/widgets/custom_container.dart';

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
          SizedBox(height: Get.width * 0.04),
          Center(
            child: Container(
              width: Get.width * 0.95,
              height: Get.height * 0.5,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  children: [
                    Text(
                      "Soal ${controller.currentQuestionIndex.value + 1} / ${controller.questions.length}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: Get.width * 0.04),
                    Text(
                      question.question,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: Get.width * 0.02),
                    ...List.generate(
                      question.options.length,
                      (index) => Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Center(
                          child: AnimatedContainerButton(
                            width: Get.width * 0.85,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            alignment: Alignment.centerLeft,
                            onTap: controller.isAnswered.value
                                ? null
                                : () {
                                    controller.answerQuestion(index);
                                  },
                            borderColor: controller.isAnswered.value
                                ? index == question.correctAnswer
                                    ? HexColor('#22A06B')
                                    : HexColor('#FF5569')
                                : HexColor('#E8E8E8'),
                            containerColor: controller.isAnswered.value
                                ? index == question.correctAnswer
                                    ? HexColor('#DCFFF1')
                                    : HexColor('#FFE9EE')
                                : Colors.white,
                            child: Text(
                              question.options[index],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: Get.height * 0.04),
          if (controller.isAnswered.value)
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: Get.width * 0.95,
                // height: Get.height * 0.3,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ]),
                child: Column(
                  children: [
                    SizedBox(height: Get.width * 0.04),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pembahasan',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          AnimatedContainerButton(
                            onTap: () {},
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            width: Get.width * 0.23,
                            height: Get.height * 0.04,
                            enableAnimation: false,
                            alignment: Alignment.centerLeft,
                            borderColor: HexColor('#22A06B'),
                            containerColor: HexColor('#DCFFF1'),
                            child: Text(
                              'Jawabanya ${question.correctAnswer == 0 ? 'A' : question.correctAnswer == 1 ? 'B' : question.correctAnswer == 2 ? 'C' : 'D'}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: HexColor('#22A06B'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        question.explanation,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Center(
                      child: CustomButton(
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
                    ),
                    SizedBox(height: Get.height * 0.03),
                  ],
                ),
              ),
            ),
        ],
      );
    });
  }
}
