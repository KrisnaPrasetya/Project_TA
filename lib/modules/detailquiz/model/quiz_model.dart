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
            "Kubus berubah menjadi lingkaran",
            "Kubus menjadi jaring-jaring",
            "Kubus tetap sama",
            "Kubus menghilang"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Bayangkan kalau kita membuka kotak susu dan meratakannya. Itu akan menjadi jaring-jaring kubus!"),
      Question(
          question: "Berapa banyak sisi yang dimiliki oleh sebuah balok?",
          options: ["4 Sisi", "5 Sisi", "6 Sisi", "8 Sisi"],
          correctAnswer: 2,
          gambarKuis: '',
          explanation:
              "Balok memiliki 6 sisi yang berbentuk persegi panjang. Sama seperti kardus sepatu!"),
      Question(
          question: "Sebuah kubus memiliki berapa titik sudut?",
          options: [
            "6 Titik sudut",
            "8 Titik sudut",
            "10 Titik sudut",
            "12 Titik sudut"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Titik sudut adalah tempat bertemunya tiga sisi kubus. Kalau kamu lihat dadu, ada 8 titik sudut!"),
      Question(
          question:
              "Jika sebuah balok diurai menjadi bagian-bagiannya, berapa banyak rusuk yang terlihat?",
          options: ["10 Rusuk", "12 Rusuk", "14 Rusuk", "16 Rusuk"],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Rusuk adalah garis tepi yang menghubungkan sisi-sisi balok. Kalau kamu melihat bingkai kotak hadiah, ada 12 rusuk!"),
      Question(
          question:
              "Jika kita menyusun dua kubus kecil menjadi satu, bangun ruang yang terbentuk adalah...?",
          options: ["Tetap kubus", "Balok", "Bola", "Prisma"],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Dua kubus kecil bisa disusun menjadi balok karena bentuknya lebih panjang!"),
      // 5 soal tambahan untuk Materi 1
      Question(
          question:
              "Berapa banyak bentuk jaring-jaring yang berbeda yang bisa dibuat dari sebuah kubus?",
          options: ["6", "8", "11", "12"],
          correctAnswer: 2,
          gambarKuis: '',
          explanation:
              "Ada 11 macam jaring-jaring kubus yang berbeda. Semuanya terdiri dari 6 persegi yang disusun dengan berbagai cara!"),
      Question(
          question: "Jaring-jaring balok terdiri dari bentuk apa saja?",
          options: [
            "6 persegi sama besar",
            "6 persegi panjang dengan ukuran bervariasi",
            "4 persegi panjang dan 2 persegi",
            "2 persegi dan 4 lingkaran"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Jaring-jaring balok terdiri dari 6 persegi panjang yang ukurannya bisa berbeda-beda sesuai dengan ukuran balok aslinya!"),
      Question(
          question:
              "Jika sebuah kubus memiliki 8 titik sudut, berapa banyak rusuk yang dimilikinya?",
          options: ["8 rusuk", "10 rusuk", "12 rusuk", "14 rusuk"],
          correctAnswer: 2,
          gambarKuis: '',
          explanation:
              "Kubus memiliki 12 rusuk. Kamu bisa menghitungnya: 4 rusuk di bagian atas, 4 rusuk di bagian bawah, dan 4 rusuk yang menghubungkan atas dan bawah!"),
      Question(
          question:
              "Jika kubus dan balok sama-sama memiliki 6 sisi, apa perbedaan utama antara keduanya?",
          options: [
            "Kubus tidak memiliki rusuk",
            "Semua sisi kubus berbentuk persegi, sedangkan balok memiliki sisi berbentuk persegi panjang",
            "Balok memiliki lebih banyak titik sudut",
            "Kubus tidak bisa dibuat jaring-jaring"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Kubus memiliki 6 sisi yang semuanya berbentuk persegi sama besar, sedangkan balok memiliki 6 sisi berbentuk persegi panjang yang ukurannya bisa berbeda-beda!"),
      Question(
          question:
              "Jika kita memotong sebuah kubus menjadi dua bagian sama besar, apa bentuk yang dihasilkan?",
          options: [
            "Dua kubus kecil",
            "Dua balok",
            "Dua prisma segitiga",
            "Dua piramida"
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
          options: ["Persegi", "Segitiga", "Lingkaran", "Persegi panjang"],
          correctAnswer: 0,
          gambarKuis: '',
          explanation:
              "Kubus selalu terlihat persegi dari atas, depan, atau samping!"),
      Question(
          question: "Jika balok diputar ke samping, bagaimana bentuknya?",
          options: [
            "Menjadi Persegi Panjang",
            "Menjadi kubus",
            "Menjadi lingkaran",
            "Menjadi segitiga"
          ],
          correctAnswer: 0,
          gambarKuis: '',
          explanation:
              "Balok tetap balok, meskipun diputar ke berbagai arah. Seperti kalau kita memutar kotak bekal!"),
      Question(
          question:
              "Jika kita melihat sebuah kubus dari sudut miring, bentuk yang terlihat adalah...?",
          options: [
            "Tetap kubus",
            "Seperti dua persegi bertumpuk",
            "Lingkaran",
            "Segitiga"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Kadang, kalau kita melihat kubus dari miring, bentuknya terlihat seperti dua persegi bertumpuk!"),
      Question(
          question:
              "Apa yang terjadi jika balok dipotong secara diagonal dari ujung ke ujung?",
          options: [
            "Menjadi dua segitiga",
            "Menjadi prisma segitiga",
            "Tetap balok",
            "Menjadi silinder"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Jika kita memotong sabun batangan secara diagonal, bentuk yang terbentuk adalah prisma segitiga!"),
      Question(
          question:
              "Jika kita melihat sebuah kubus dari tiga arah berbeda (atas, depan, samping), bagaimana bentuk yang terlihat?",
          options: [
            "Selalu sama",
            "Bisa berbeda",
            "Tidak bisa dilihat dari tiga arah",
            "Hanya satu sisi yang bisa terlihat"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Seperti saat kamu menggambar rumah mainan dari sisi berbeda, kubus juga terlihat berbeda dari tiap arah!"),
      // 5 soal tambahan untuk Materi 2
      Question(
          question: "Jika balok dilihat dari atas, apa bentuk yang terlihat?",
          options: ["Segitiga", "Persegi", "Persegi panjang", "Lingkaran"],
          correctAnswer: 2,
          gambarKuis: '',
          explanation:
              "Balok ketika dilihat dari atas akan terlihat sebagai persegi panjang, bukan persegi seperti kubus!"),
      Question(
          question:
              "Jika kita melihat balok dari sudut miring atas, bentuk apakah yang terlihat?",
          options: [
            "Hanya persegi panjang",
            "Beberapa persegi panjang yang tumpang tindih",
            "Segitiga",
            "Lingkaran"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Jika melihat balok dari sudut miring atas, kita bisa melihat beberapa persegi panjang yang tumpang tindih!"),
      Question(
          question:
              "Jika dua balok disusun di samping satu sama lain, bangun apakah yang terbentuk?",
          options: [
            "Tetap dua balok terpisah",
            "Menjadi kubus",
            "Menjadi balok yang lebih besar",
            "Menjadi prisma segitiga"
          ],
          correctAnswer: 2,
          gambarKuis: '',
          explanation:
              "Jika dua balok identik disusun berdampingan, mereka akan membentuk satu balok yang lebih besar. Bayangkan saat kamu menyusun dua kotak bekal berdampingan!"),
      Question(
          question:
              "Jika sebuah balok dipotong tepat di tengah secara vertikal, apa bentuk yang dihasilkan dari potongan tersebut?",
          options: [
            "Dua balok yang lebih kecil",
            "Dua kubus",
            "Dua prisma segitiga",
            "Dua piramida"
          ],
          correctAnswer: 0,
          gambarKuis: '',
          explanation:
              "Jika balok dipotong tepat di tengah secara vertikal, kita akan mendapatkan dua balok yang lebih kecil dengan ukuran yang sama!"),
      Question(
          question:
              "Jika kita memotong kubus dari sudut ke sudut diagonal yang berlawanan, bentuk apa yang akan terbentuk?",
          options: [
            "Dua balok",
            "Dua prisma segitiga",
            "Enam piramida",
            "Empat prisma segitiga"
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
          options: ["C1", "C3", "B2", "D2"],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Berpindah ke kanan dalam peta berarti meningkatkan angka kolom!"),
      Question(
          question:
              "Jika rumah Tigor ada di petak B4 dan sekolahnya di B6, berapa langkah horizontal yang harus ditempuh?",
          options: ["2", "3", "4", "5"],
          correctAnswer: 0,
          gambarKuis: '',
          explanation: "Dari B4 ke B6, cukup 2 langkah horizontal ke kanan!"),
      Question(
          question:
              "Jika Tigor ada di petak A3 dan ingin ke petak C3, berapa langkah vertikal yang harus dilakukan?",
          options: ["1", "2", "3", "4"],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Pindah ke bawah dalam peta berarti bergerak secara vertikal ke baris yang lebih besar!"),
      Question(
          question:
              "Jika Tenri ada di D5 dan ingin menuju ke B5, bagaimana cara bergeraknya?",
          options: [
            "2 langkah ke atas",
            "2 langkah ke kanan",
            "2 langkah ke kiri",
            "2 langkah ke bawah"
          ],
          correctAnswer: 0,
          gambarKuis: '',
          explanation:
              "Karena bergerak dari D ke B, kita harus naik 2 langkah ke atas!"),
      Question(
          question:
              "Jika rumah Tigor ada di A1 dan rumah Tenri di C3, bagaimana cara bergeraknya?",
          options: [
            "2 langkah ke bawah dan 2 ke kanan",
            "2 langkah ke atas dan 2 ke kanan",
            "2 langkah ke kanan dan 2 ke atas",
            "3 langkah ke kanan dan 1 ke atas"
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
            "1 langkah ke kanan",
            "2 langkah ke kanan",
            "2 langkah ke bawah",
            "3 langkah ke kanan"
          ],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Dari D3 ke D5, kita perlu bergerak 2 langkah ke kanan, karena kolom berubah dari 3 menjadi 5, sementara baris tetap D!"),
      Question(
          question:
              "Jika Rudi berada di petak B2 dan ingin pergi ke petak D4, bagaimana pergerakannya?",
          options: [
            "2 langkah ke kanan dan 2 ke bawah",
            "2 langkah ke kiri dan 2 ke atas",
            "2 langkah ke bawah dan 2 ke kanan",
            "4 langkah diagonal ke kanan bawah"
          ],
          correctAnswer: 0,
          gambarKuis: '',
          explanation:
              "Untuk bergerak dari B2 ke D4, Rudi harus bergerak 2 langkah ke kanan (dari kolom 2 ke 4) dan 2 langkah ke bawah (dari baris B ke D)!"),
      Question(
          question:
              "Jika pada peta terdapat taman di petak A4, dan Lisa berada di petak C2, bagaimana Lisa harus bergerak untuk sampai ke taman?",
          options: [
            "2 langkah ke atas dan 2 langkah ke kanan",
            "2 langkah ke atas dan 2 langkah ke kiri",
            "2 langkah ke bawah dan 2 langkah ke kanan",
            "2 langkah ke kiri dan 2 langkah ke atas"
          ],
          correctAnswer: 0,
          gambarKuis: '',
          explanation:
              "Untuk bergerak dari C2 ke A4, Lisa harus bergerak 2 langkah ke atas (dari baris C ke A) dan 2 langkah ke kanan (dari kolom 2 ke 4)!"),
      Question(
          question:
              "Jika rumah Danu ada di petak B3 dan rumah Sinta di petak E3, berapa banyak langkah vertikal yang harus ditempuh Danu untuk sampai ke rumah Sinta?",
          options: ["2 langkah", "3 langkah", "4 langkah", "5 langkah"],
          correctAnswer: 1,
          gambarKuis: '',
          explanation:
              "Untuk bergerak dari B3 ke E3, Danu harus bergerak 3 langkah vertikal ke bawah (dari baris B ke E), sementara kolomnya tetap 3!"),
      Question(
          question:
              "Jika kita berada di petak D4 dan ingin menuju ke petak A1, bagaimana cara bergeraknya?",
          options: [
            "3 langkah ke atas dan 3 langkah ke kiri",
            "3 langkah ke bawah dan 3 langkah ke kanan",
            "4 langkah ke atas dan 3 langkah ke kiri",
            "3 langkah ke atas dan 4 langkah ke kiri"
          ],
          correctAnswer: 0,
          gambarKuis: '',
          explanation:
              "Untuk bergerak dari D4 ke A1, kita harus bergerak 3 langkah ke atas (dari D ke A) dan 3 langkah ke kiri (dari 4 ke 1)!"),
    ],
  };
}
