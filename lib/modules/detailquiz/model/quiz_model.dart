class Question {
  final String question;
  final List<String> options;
  final int correctAnswer;
  final String explanation;
  final String gambarKuis;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.explanation,
    required this.gambarKuis,
  });
}

class QuizData {
  static final Map<int, List<Question>> materialQuestions = {
    1: [
      Question(
          question:
              "Apa yang terjadi jika kita membuka seluruh sisi kubus dan meratakannya?",
          options: [
            "A. Kubus berubah menjadi lingkaran",
            "B. Kubus menjadi jaring-jaring",
            "C. Kubus tetap sama",
            "D. Kubus menghilang"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Bayangkan kalau kita membuka kotak susu dan meratakannya. Itu akan menjadi jaring-jaring kubus!"),
      Question(
          question: "Berapa banyak sisi yang dimiliki oleh sebuah balok?",
          options: ["A. 4 Sisi", "B. 5 Sisi", "C. 6 Sisi", "D. 8 Sisi"],
          correctAnswer: 2,
          gambarKuis: '',
          explanation:
              "Balok memiliki 6 sisi yang berbentuk persegi panjang. Sama seperti kardus sepatu!"),
      Question(
          question: "Sebuah kubus memiliki berapa titik sudut?",
          options: [
            "A. 6 Titik sudut",
            "B. 8 Titik sudut",
            "C. 10 Titik sudut",
            "D. 12 Titik sudut"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Titik sudut adalah tempat bertemunya tiga sisi kubus. Kalau kamu lihat dadu, ada 8 titik sudut!"),
      Question(
          question:
              "Jika sebuah balok diurai menjadi bagian-bagiannya, berapa banyak rusuk yang terlihat?",
          options: [
            "A. 10 Rusuk",
            "B. 12 Titik sudut",
            "C. 14 Titik sudut",
            "D. 16 Titik sudut"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Rusuk adalah garis tepi yang menghubungkan sisi-sisi balok. Kalau kamu melihat bingkai kotak hadiah, ada 12 rusuk!"),
      Question(
          question:
              "Jika kita menyusun dua kubus kecil menjadi satu, bangun ruang yang terbentuk adalah...?",
          options: ["A. Tetap kubus", "B. Balok", "C. Bola", "D. Prisma"],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Dua kubus kecil bisa disusun menjadi balok karena bentuknya lebih panjang!"),
    ],
    2: [
      Question(
          question:
              "Jika kubus dilihat dari atas, bentuk yang terlihat adalah...?",
          options: [
            "A. Persegi",
            "B. Segitiga",
            "C. Lingkaran",
            "D. Persegi panjang"
          ],
          correctAnswer: 0,
          gambarKuis: '',
          explanation:
              "Kubus selalu terlihat persegi dari atas, depan, atau samping!"),
      Question(
          question: "Jika balok diputar ke samping, bagaimana bentuknya?",
          options: [
            "A. Tetap balok",
            "B. Menjadi kubus",
            "C. Menjadi lingkaran",
            "D. Menjadi segitiga"
          ],
          correctAnswer: 0,
          gambarKuis: '',
          explanation:
              "Balok tetap balok, meskipun diputar ke berbagai arah. Seperti kalau kita memutar kotak bekal!"),
      Question(
          question:
              "Jika kita melihat sebuah kubus dari sudut tertentu, bentuk yang terlihat adalah...?",
          options: [
            "A. Tetap kubus",
            "B. Seperti dua persegi bertumpuk",
            "C. Lingkaran",
            "D. Segitiga"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Kadang, kalau kita melihat kubus dari sudut, bentuknya terlihat seperti dua persegi bertumpuk!"),
      Question(
          question:
              "Apa yang terjadi jika balok dipotong secara diagonal dari ujung ke ujung?",
          options: [
            "A. Menjadi dua segitiga",
            "B. Menjadi dua prisma segitiga",
            "C. Tetap balok",
            "D. Menjadi silinder"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Jika kita memotong sabun batangan secara diagonal, bentuk yang terbentuk adalah prisma segitiga!"),
      Question(
          question:
              "Jika kita melihat sebuah kubus dari tiga arah berbeda (atas, depan, samping), bagaimana bentuk yang terlihat?",
          options: [
            "A. Selalu sama",
            "B. Bisa berbeda",
            "C. Tidak bisa dilihat dari tiga arah",
            "D. Hanya satu sisi yang bisa terlihat"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Seperti saat kamu menggambar rumah mainan dari sisi berbeda, kubus juga terlihat berbeda dari tiap arah!"),
    ],
    3: [
      Question(
          question:
              "Makassar terletak di petak C2 dalam peta. Jika kita bergerak satu langkah ke kanan, kita ada di petak...?",
          options: ["A. C1", "B. C3", "C. B2", "D. D2"],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Berpindah ke kanan dalam peta berarti meningkatkan angka kolom!"),
      Question(
          question:
              "Jika rumah Tigor ada di petak B4 dan sekolahnya di B6, berapa langkah horizontal yang harus ditempuh?",
          options: ["A. 2", "B. 3", "C. 4", "D. 5"],
          correctAnswer: 0,
          gambarKuis: '',
          explanation: "Dari B4 ke B6, cukup 2 langkah horizontal ke kanan!"),
      Question(
          question:
              "Jika Tigor ada di petak A3 dan ingin ke petak C3, berapa langkah vertikal yang harus dilakukan?",
          options: ["A. 1", "B. 2", "C. 3", "D. 4"],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Pindah ke bawah dalam peta berarti bergerak secara vertikal ke baris yang lebih besar!"),
      Question(
          question:
              "Jika Tenri ada di D5 dan ingin menuju ke B5, bagaimana cara bergeraknya?",
          options: [
            "A. 2 langkah ke atas",
            "B. 2 langkah ke kanan",
            "C. 2 langkah ke kiri",
            "D. 2 langkah ke bawah"
          ],
          correctAnswer: 0,
          gambarKuis: '',
          explanation:
              "Karena bergerak dari D ke B, kita harus naik 2 langkah ke atas!"),
      Question(
          question:
              "Jika rumah Tigor ada di A1 dan rumah Tenri di C3, bagaimana cara bergeraknya?",
          options: [
            "A. 2 langkah ke bawah dan 2 ke kanan",
            "B. 2 langkah ke atas dan 2 ke kanan",
            "C. 2 langkah ke kanan dan 2 ke atas",
            "D. 3 langkah ke kanan dan 1 ke atas"
          ],
          correctAnswer: 0,
          gambarKuis: '',
          explanation:
              "Untuk sampai dari A1 ke C3, kita harus turun 2 langkah dan ke kanan 2 langkah!"),
    ],
  };
}
