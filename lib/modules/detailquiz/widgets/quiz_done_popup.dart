import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:project_ta/widgets/custom_button.dart';

class QuizCompletionDialog extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final Function() onClose;

  const QuizCompletionDialog({
    Key? key,
    required this.score,
    required this.totalQuestions,
    required this.onClose,
  }) : super(key: key);

  String _getResultMessage() {
    final percentage = (score / (totalQuestions * 20)) * 100;

    if (percentage >= 80) {
      return 'Luar Biasa! Kamu sangat menguasai materi ini.';
    } else if (percentage >= 60) {
      return 'Hebat! Kamu sudah memahami sebagian besar materi.';
    } else if (percentage >= 40) {
      return 'Bagus! Teruslah berlatih untuk meningkatkan pemahamanmu.';
    } else {
      return 'Jangan menyerah! Cobalah pelajari materi lagi dan ulangi kuisnya.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final int maxScore = totalQuestions * 20;
    final double percentage = (score / maxScore) * 100;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(Get.width * 0.05),
        width: Get.width * 0.85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Kuis Selesai!',
              style: TextStyle(
                fontSize: Get.width * 0.06,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            // Score display with circular progress
            Container(
              height: Get.width * 0.3,
              width: Get.width * 0.3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: score >= 80
                      ? HexColor('#22A06B')
                      : score >= 60
                          ? HexColor('#FFC100')
                          : HexColor('#FF3D00'),
                  width: 3,
                ),
              ),
              child: Center(
                child: Stack(
                  children: [
                    Positioned(
                      top: 25,
                      left: 33,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$score',
                            style: TextStyle(
                              fontSize: Get.width * 0.08,
                              fontWeight: FontWeight.bold,
                              color: score >= 80
                                  ? HexColor('#22A06B')
                                  : score >= 60
                                      ? HexColor('#FFC100')
                                      : HexColor('#FF3D00'),
                            ),
                          ),
                          Text(
                            'dari $maxScore',
                            style: TextStyle(
                              fontSize: Get.width * 0.035,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Lottie.asset(
                      'assets/lottie/confetti.json',
                      height: Get.height * 0.15,
                      repeat: true,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.02),

            // Percentage
            Text(
              '${percentage.toStringAsFixed(0)} Poin',
              style: TextStyle(
                fontSize: Get.width * 0.05,
                fontWeight: FontWeight.bold,
                color: score >= 80
                    ? HexColor('#22A06B')
                    : score >= 60
                        ? HexColor('#FFC100')
                        : HexColor('#FF3D00'),
              ),
            ),
            SizedBox(height: Get.height * 0.02),

            // Congratulation message
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              child: Text(
                _getResultMessage(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Get.width * 0.04,
                  color: Colors.grey[800],
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.03),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  width: Get.width * 0.6,
                  color: HexColor('#22A06B'),
                  onPressed: onClose,
                  child: Text(
                    'Kembali ke Kuis',
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
      ),
    );
  }
}
