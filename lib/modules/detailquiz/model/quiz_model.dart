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
      // 5 soal tambahan untuk Materi 1
      Question(
          question:
              "Berapa banyak bentuk jaring-jaring yang berbeda yang bisa dibuat dari sebuah kubus?",
          options: ["A. 6", "B. 8", "C. 11", "D. 12"],
          correctAnswer: 2,
          gambarKuis: '',
          explanation:
              "Ada 11 macam jaring-jaring kubus yang berbeda. Semuanya terdiri dari 6 persegi yang disusun dengan berbagai cara!"),
      Question(
          question:
              "Jaring-jaring balok terdiri dari bentuk apa saja?",
          options: [
            "A. 6 persegi sama besar",
            "B. 6 persegi panjang dengan ukuran bervariasi",
            "C. 4 persegi panjang dan 2 persegi",
            "D. 2 persegi dan 4 lingkaran"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Jaring-jaring balok terdiri dari 6 persegi panjang yang ukurannya bisa berbeda-beda sesuai dengan ukuran balok aslinya!"),
      Question(
          question:
              "Jika sebuah kubus memiliki 8 titik sudut, berapa banyak rusuk yang dimilikinya?",
          options: ["A. 8 rusuk", "B. 10 rusuk", "C. 12 rusuk", "D. 14 rusuk"],
          correctAnswer: 2,
          gambarKuis: '',
          explanation:
              "Kubus memiliki 12 rusuk. Kamu bisa menghitungnya: 4 rusuk di bagian atas, 4 rusuk di bagian bawah, dan 4 rusuk yang menghubungkan atas dan bawah!"),
      Question(
          question:
              "Jika kubus dan balok sama-sama memiliki 6 sisi, apa perbedaan utama antara keduanya?",
          options: [
            "A. Kubus tidak memiliki rusuk",
            "B. Semua sisi kubus berbentuk persegi, sedangkan balok memiliki sisi berbentuk persegi panjang",
            "C. Balok memiliki lebih banyak titik sudut",
            "D. Kubus tidak bisa dibuat jaring-jaring"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Kubus memiliki 6 sisi yang semuanya berbentuk persegi sama besar, sedangkan balok memiliki 6 sisi berbentuk persegi panjang yang ukurannya bisa berbeda-beda!"),
      Question(
          question:
              "Jika kita memotong sebuah kubus menjadi dua bagian sama besar, apa bentuk yang dihasilkan?",
          options: [
            "A. Dua kubus kecil",
            "B. Dua balok",
            "C. Dua prisma segitiga",
            "D. Dua piramida"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Jika kita memotong kubus menjadi dua bagian sama besar, hasilnya adalah dua balok yang identik. Bayangkan kita memotong dadu menjadi dua bagian!"),
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
            "A. Menjadi Persegi Panjang",
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
              "Jika kita melihat sebuah kubus dari sudut miring, bentuk yang terlihat adalah...?",
          options: [
            "A. Tetap kubus",
            "B. Seperti dua persegi bertumpuk",
            "C. Lingkaran",
            "D. Segitiga"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Kadang, kalau kita melihat kubus dari miring, bentuknya terlihat seperti dua persegi bertumpuk!"),
      Question(
          question:
              "Apa yang terjadi jika balok dipotong secara diagonal dari ujung ke ujung?",
          options: [
            "A. Menjadi dua segitiga",
            "B. Menjadi prisma segitiga",
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
      // 5 soal tambahan untuk Materi 2
      Question(
          question:
              "Jika balok dilihat dari atas, apa bentuk yang terlihat?",
          options: [
            "A. Segitiga",
            "B. Persegi",
            "C. Persegi panjang",
            "D. Lingkaran"
          ],
          correctAnswer: 2,
          gambarKuis: '',
          explanation:
              "Balok ketika dilihat dari atas akan terlihat sebagai persegi panjang, bukan persegi seperti kubus!"),
      Question(
          question:
              "Jika kita melihat balok dari sudut miring atas, bentuk apakah yang terlihat?",
          options: [
            "A. Hanya persegi panjang",
            "B. Beberapa persegi panjang yang tumpang tindih",
            "C. Segitiga",
            "D. Lingkaran"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Jika melihat balok dari sudut miring atas, kita bisa melihat beberapa persegi panjang yang tumpang tindih, membentuk gambar 3D balok!"),
      Question(
          question:
              "Jika dua balok disusun di samping satu sama lain, bangun apakah yang terbentuk?",
          options: [
            "A. Tetap dua balok terpisah",
            "B. Menjadi kubus",
            "C. Menjadi balok yang lebih besar",
            "D. Menjadi prisma segitiga"
          ],
          correctAnswer: 2,
          gambarKuis: '',
          explanation:
              "Jika dua balok identik disusun berdampingan, mereka akan membentuk satu balok yang lebih besar. Bayangkan saat kamu menyusun dua kotak bekal berdampingan!"),
      Question(
          question:
              "Jika sebuah balok dipotong tepat di tengah secara vertikal, apa bentuk yang dihasilkan dari potongan tersebut?",
          options: [
            "A. Dua balok yang lebih kecil",
            "B. Dua kubus",
            "C. Dua prisma segitiga",
            "D. Dua piramida"
          ],
          correctAnswer: 0,
          gambarKuis: '',
          explanation:
              "Jika balok dipotong tepat di tengah secara vertikal, kita akan mendapatkan dua balok yang lebih kecil dengan ukuran yang sama!"),
      Question(
          question:
              "Jika kita memotong kubus dari sudut ke sudut diagonal yang berlawanan, bentuk apa yang akan terbentuk?",
          options: [
            "A. Dua balok",
            "B. Dua prisma segitiga",
            "C. Enam piramida",
            "D. Empat prisma segitiga"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Jika kita memotong kubus dari satu sudut ke sudut diagonal yang berlawanan, kita akan mendapatkan dua prisma segitiga. Ini seperti memotong dadu secara diagonal!"),
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
      // 5 soal tambahan untuk Materi 3
      Question(
          question:
              "Jika perpustakaan terletak di petak D3 dan kantin di petak D5, berapa langkah yang harus ditempuh?",
          options: [
            "A. 1 langkah ke kanan", 
            "B. 2 langkah ke kanan", 
            "C. 2 langkah ke bawah", 
            "D. 3 langkah ke kanan"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Dari D3 ke D5, kita perlu bergerak 2 langkah ke kanan, karena kolom berubah dari 3 menjadi 5, sementara baris tetap D!"),
      Question(
          question:
              "Jika Rudi berada di petak B2 dan ingin pergi ke petak D4, bagaimana pergerakannya?",
          options: [
            "A. 2 langkah ke kanan dan 2 ke bawah",
            "B. 2 langkah ke kiri dan 2 ke atas",
            "C. 2 langkah ke bawah dan 2 ke kanan",
            "D. 4 langkah diagonal ke kanan bawah"
          ],
          correctAnswer: 0,
          gambarKuis: '',
          explanation:
              "Untuk bergerak dari B2 ke D4, Rudi harus bergerak 2 langkah ke kanan (dari kolom 2 ke 4) dan 2 langkah ke bawah (dari baris B ke D)!"),
      Question(
          question:
              "Jika pada peta terdapat taman di petak A4, dan Lisa berada di petak C2, bagaimana Lisa harus bergerak untuk sampai ke taman?",
          options: [
            "A. 2 langkah ke atas dan 2 langkah ke kanan",
            "B. 2 langkah ke atas dan 2 langkah ke kiri",
            "C. 2 langkah ke bawah dan 2 langkah ke kanan",
            "D. 2 langkah ke kiri dan 2 langkah ke atas"
          ],
          correctAnswer: 0,
          gambarKuis: '',
          explanation:
              "Untuk bergerak dari C2 ke A4, Lisa harus bergerak 2 langkah ke atas (dari baris C ke A) dan 2 langkah ke kanan (dari kolom 2 ke 4)!"),
      Question(
          question:
              "Jika rumah Danu ada di petak B3 dan rumah Sinta di petak E3, berapa banyak langkah vertikal yang harus ditempuh Danu untuk sampai ke rumah Sinta?",
          options: [
            "A. 2 langkah", 
            "B. 3 langkah", 
            "C. 4 langkah", 
            "D. 5 langkah"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Untuk bergerak dari B3 ke E3, Danu harus bergerak 3 langkah vertikal ke bawah (dari baris B ke E), sementara kolomnya tetap 3!"),
      Question(
          question:
              "Jika kita berada di petak D4 dan ingin menuju ke petak A1, bagaimana cara bergeraknya?",
          options: [
            "A. 3 langkah ke atas dan 3 langkah ke kiri",
            "B. 3 langkah ke bawah dan 3 langkah ke kanan",
            "C. 4 langkah ke atas dan 3 langkah ke kiri",
            "D. 3 langkah ke atas dan 4 langkah ke kiri"
          ],
          correctAnswer: 0,
          gambarKuis: '',
          explanation:
              "Untuk bergerak dari D4 ke A1, kita harus bergerak 3 langkah ke atas (dari D ke A) dan 3 langkah ke kiri (dari 4 ke 1)!"),
    ],
  };
}