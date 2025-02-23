// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:lottie/lottie.dart';
// import 'package:project_ta/modules/detailquiz/controller/quizdetail_controller.dart';
// import 'package:project_ta/widgets/custom_button.dart';
// import 'package:project_ta/widgets/custom_container.dart';

// class QuizQuestionWidget extends StatelessWidget {
//   final QuizdetailController controller;

//   const QuizQuestionWidget({Key? key, required this.controller})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       final question =
//           controller.questions[controller.currentQuestionIndex.value];
//       return Column(
//         children: [
//           SizedBox(height: Get.height * 0.04),
//           Center(
//             child: AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//               width: Get.width * 0.95,
//               height: controller.isAnswered.value
//                   ? Get.height * 0.75 // Height when showing explanation
//                   : Get.height * 0.44, // Initial height
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 10,
//                       offset: Offset(0, 3),
//                     ),
//                   ]),
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: Get.width * 0.05,
//                       vertical: Get.height * 0.02),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Pilihan jawaban ",
//                         style: TextStyle(
//                           fontSize: Get.width * 0.04,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: Get.height * 0.02),
//                       ...List.generate(
//                         question.options.length,
//                         (index) => Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: Get.width * 0.02,
//                               vertical: Get.height * 0.01),
//                           child: Center(
//                             child: AnimatedContainerButton(
//                               width: Get.width * 0.85,
//                               height: Get.height * 0.06,
//                               enableAnimation: !controller.isAnswered.value,
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: Get.width * 0.04),
//                               alignment: Alignment.centerLeft,
//                               onTap: () {
//                                 if (!controller.isAnswered.value) {
//                                   controller.answerQuestion(index);
//                                 }
//                               },
//                               borderColor: controller.isAnswered.value
//                                   ? controller.selectedAnswerIndex.value ==
//                                           index
//                                       ? (index == question.correctAnswer
//                                           ? HexColor('#22A06B')
//                                           : HexColor('#FF5569'))
//                                       : HexColor('#E8E8E8')
//                                   : HexColor('#E8E8E8'),
//                               containerColor: controller.isAnswered.value
//                                   ? controller.selectedAnswerIndex.value ==
//                                           index
//                                       ? (index == question.correctAnswer
//                                           ? HexColor('#DCFFF1')
//                                           : HexColor('#FFE9EE'))
//                                       : Colors.white
//                                   : Colors.white,
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       question.options[index],
//                                       style: TextStyle(
//                                         fontSize: Get.width * 0.04,
//                                         fontWeight: controller.isAnswered.value
//                                             ? controller.selectedAnswerIndex
//                                                         .value ==
//                                                     index
//                                                 ? (index ==
//                                                         question.correctAnswer
//                                                     ? FontWeight.w600
//                                                     : FontWeight.w600)
//                                                 : FontWeight.w400
//                                             : FontWeight.w400,
//                                         color: controller.isAnswered.value
//                                             ? controller.selectedAnswerIndex
//                                                         .value ==
//                                                     index
//                                                 ? (index ==
//                                                         question.correctAnswer
//                                                     ? HexColor('#22A06B')
//                                                     : HexColor('#FF5569'))
//                                                 : Colors.black
//                                             : Colors.black,
//                                       ),
//                                     ),
//                                   ),
//                                   controller.isAnswered.value &&
//                                           controller
//                                                   .selectedAnswerIndex.value ==
//                                               index
//                                       ? controller.selectedAnswerIndex.value ==
//                                               question.correctAnswer
//                                           ? Lottie.asset(
//                                               'assets/lottie/correct2.json',
//                                               repeat: false,
//                                             )
//                                           : Lottie.asset(
//                                               'assets/lottie/wrong.json',
//                                               width: Get.width * 0.06,
//                                               height: Get.height * 0.03,
//                                               repeat: false)
//                                       : SizedBox.shrink()
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),

//                       // Explanation section
//                       if (controller.isAnswered.value) ...[
//                         SizedBox(height: Get.height * 0.03),
//                         Divider(),
//                         SizedBox(height: Get.height * 0.02),
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: Get.width * 0.04),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Pembahasan',
//                                 style: TextStyle(
//                                   fontSize: Get.width * 0.04,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               AnimatedContainerButton(
//                                 onTap: () {},
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: Get.width * 0.015),
//                                 width: Get.width * 0.27,
//                                 height: Get.height * 0.05,
//                                 enableAnimation: false,
//                                 alignment: Alignment.centerLeft,
//                                 borderColor: HexColor('#22A06B'),
//                                 containerColor: HexColor('#DCFFF1'),
//                                 child: Text(
//                                   'Jawabanya ${question.correctAnswer == 0 ? 'A' : question.correctAnswer == 1 ? 'B' : question.correctAnswer == 2 ? 'C' : 'D'}',
//                                   style: TextStyle(
//                                     fontSize: Get.width * 0.035,
//                                     fontWeight: FontWeight.w600,
//                                     color: HexColor('#22A06B'),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(Get.width * 0.04),
//                           child: Text(
//                             question.explanation,
//                             style: TextStyle(
//                               fontSize: Get.width * 0.04,
//                             ),
//                             textAlign: TextAlign.justify,
//                           ),
//                         ),
//                         Center(
//                           child: CustomButton(
//                             width: Get.width * 0.8,
//                             color: Colors.green,
//                             onPressed: controller.currentQuestionIndex.value <
//                                     controller.questions.length - 1
//                                 ? () => controller.nextQuestion()
//                                 : () async {
//                                     await controller.saveScore();
//                                     Get.back();
//                                   },
//                             child: Text(
//                               controller.currentQuestionIndex.value <
//                                       controller.questions.length - 1
//                                   ? "Pertanyaan Selanjutnya"
//                                   : "Selesai",
//                               style: TextStyle(
//                                 fontSize: Get.width * 0.04,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: Get.height * 0.03),
//                       ],
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: Get.height * 0.06),
//         ],
//       );
//     });
//   }
// }
