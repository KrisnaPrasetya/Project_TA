import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class QuizCompletionDialog extends StatelessWidget {
  final int score;
  final int highestScore;
  final int totalQuestions;
  final bool isFirstAttempt;
  final int attemptsRemaining;
  final int minimumPassingScore;
  final VoidCallback onClose;
  final VoidCallback? onRetry;

  const QuizCompletionDialog({
    Key? key,
    required this.score,
    required this.highestScore,
    required this.totalQuestions,
    required this.isFirstAttempt,
    required this.attemptsRemaining,
    required this.minimumPassingScore,
    required this.onClose,
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool passed = score >= minimumPassingScore;
    final bool canRetry = attemptsRemaining > 0 && !passed;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Animation based on result

            // Title based on result
            Text(
              passed ? 'Selamat Kamu Berhasil!' : 'Yuk Belajar Lagi!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: passed ? Colors.green : Colors.black,
              ),
            ),
            passed
                ? Lottie.asset(
                    'assets/lottie/success.json',
                    repeat: true,
                    width: 150,
                    height: 150,
                  )
                : SizedBox.shrink(),
            // Message based on result
            Text(
              passed
                  ? 'Kamu berhasil mendapatkan nilai minimum!'
                  : 'Kamu belum mencapai nilai minimum, tetap semangat!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),

            // Score display
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Skor Kamu:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$score',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: passed ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            // Highest score display (if applicable)
            if (highestScore > score && !isFirstAttempt)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Skor Tertinggi:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$highestScore / ${totalQuestions * 10}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Message about attempts remaining
            if (canRetry)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Kamu masih memiliki $attemptsRemaining kesempatan lagi.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),

            // Note about second attempt score cap
            if (canRetry)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Catatan: Skor maksimum pada percobaan kedua adalah 80 poin.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ),

            SizedBox(height: 24),

            // Buttons
            Row(
              mainAxisAlignment: canRetry
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.center,
              children: [
                if (canRetry)
                  ElevatedButton(
                    onPressed: onRetry,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: Text(
                      'Coba Lagi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ElevatedButton(
                  onPressed: onClose,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: passed ? Colors.green : Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    'Selesai',
                    style: TextStyle(
                      fontSize: 16,
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
