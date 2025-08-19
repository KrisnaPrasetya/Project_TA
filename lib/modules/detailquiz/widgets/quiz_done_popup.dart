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
    // --- Logic Flags ---
    final bool passed = score >= minimumPassingScore;
    final bool canRetry = attemptsRemaining > 0 && !passed;
    final bool noMoreAttempts = attemptsRemaining <= 0 && !passed;

    // --- Helper untuk membangun pesan dinamis ---
    Widget _buildMessageContent() {
      if (passed) {
        return Text(
          'Keren! Kamu berhasil melewati nilai minimum. Terus pertahankan semangat belajarmu ya!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18), // FONT SIZE UPDATED
        );
      } else if (canRetry) {
        return Column(
          children: [
            Text(
              'Yah, sayang sekali nilaimu belum cukup. Tapi jangan sedih, kamu masih punya $attemptsRemaining kesempatan lagi untuk mencoba!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17),
            ),
            Lottie.asset(
              'assets/lottie/maskot.json', // Pastikan path asset benar
              repeat: true,
              width: 150,
              height: 150,
            ),
            Text(
              'Ingat ya, di kesempatan berikutnya, nilai paling tinggi yang bisa kamu dapat adalah 80 poin. Kamu pasti bisa!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16, color: Colors.grey[700]), // FONT SIZE UPDATED
            ),
          ],
        );
      } else {
        // Gagal dan kesempatan habis
        return Column(
          children: [
            Text(
              'Kesempatanmu untuk kuis ini sudah habis.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16), // FONT SIZE UPDATED
            ),
            const SizedBox(height: 8),
            Lottie.asset(
              'assets/lottie/wink.json', 
              repeat: true,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 8),
            Text(
              'Tidak apa-apa, kamu tetap bisa lanjut ke kuis berikutnya kok! Terus belajar dan coba lagi di lain waktu ya!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16), // FONT SIZE UPDATED
            ),
          ],
        );
      }
    }

    // --- Helper untuk membangun Judul dinamis ---
    String _getTitle() {
      if (passed) return 'Hebat, Kamu Berhasil!';
      if (canRetry) return 'Sedikit Lagi, Semangat!';
      return 'Jangan Menyerah!';
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Judul berdasarkan hasil
            Text(
              _getTitle(),
              style: TextStyle(
                fontSize: 26, // FONT SIZE UPDATED
                fontWeight: FontWeight.bold,
                color: passed ? Colors.green.shade700 : Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),

            // Animasi Lottie jika berhasil
            if (passed)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Lottie.asset(
                  'assets/lottie/success.json', // Pastikan path asset benar
                  repeat: true,
                  width: 150,
                  height: 150,
                ),
              ),

            SizedBox(height: 16),

            // Pesan konten berdasarkan hasil
            _buildMessageContent(),

            SizedBox(height: 24),

            // Tampilan Skor
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
                      fontSize: 18, // FONT SIZE UPDATED
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$score',
                    style: TextStyle(
                      fontSize: 20, // FONT SIZE UPDATED
                      fontWeight: FontWeight.bold,
                      color:
                          passed ? Colors.green.shade700 : Colors.red.shade600,
                    ),
                  ),
                ],
              ),
            ),

            // Tampilan skor tertinggi (jika bukan percobaan pertama)
            if (!isFirstAttempt)
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
                          fontSize: 18, // FONT SIZE UPDATED
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$highestScore',
                        style: TextStyle(
                          fontSize: 20, // FONT SIZE UPDATED
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            SizedBox(height: 24),

            // Tombol Aksi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Tombol "Coba Lagi" hanya muncul jika bisa mencoba lagi
                if (canRetry)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onRetry,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber.shade700,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text(
                        'Coba Lagi',
                        style: TextStyle(
                          fontSize: 18, // FONT SIZE UPDATED
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                // Beri jarak jika ada dua tombol
                if (canRetry) SizedBox(width: 16),

                // Tombol "Selesai" selalu ada
                Expanded(
                  child: ElevatedButton(
                    onPressed: onClose,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          passed ? Colors.green.shade600 : Colors.blue.shade600,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      'Selesai',
                      style: TextStyle(
                        fontSize: 18, // FONT SIZE UPDATED
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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
