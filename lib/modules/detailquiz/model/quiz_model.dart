class Question {
  final String question;
  final List<String> options;
  final int correctAnswer;
  final String explanation;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.explanation,
  });
}

class QuizData {
  static final Map<int, List<Question>> materialQuestions = {
    1: [
      Question(
        question: "Apa yang dimaksud dengan jaring-jaring kubus?",
        options: [
          "Rangkaian persegi yang membentuk kubus",
          "Garis yang membentuk kubus",
          "Titik sudut kubus",
          "Sisi kubus"
        ],
        correctAnswer: 0,
        explanation: "Jaring-jaring kubus adalah rangkaian persegi yang jika dilipat akan membentuk kubus."
      ),
      Question(
        question: "Berapa jumlah sisi pada sebuah balok?",
        options: ["4 sisi", "6 sisi", "8 sisi", "12 sisi"],
        correctAnswer: 1,
        explanation: "Balok memiliki 6 sisi yang terdiri dari 3 pasang sisi yang berhadapan."
      ),
      Question(
        question: "Apa ciri khas dari kubus?",
        options: [
          "Semua sisinya berbeda",
          "Memiliki 12 rusuk sama panjang",
          "Memiliki 4 sisi",
          "Memiliki 8 titik sudut"
        ],
        correctAnswer: 1,
        explanation: "Kubus memiliki 12 rusuk yang sama panjang sebagai salah satu ciri khasnya."
      ),
      Question(
        question: "Bagaimana cara menghitung volume kubus?",
        options: [
          "Panjang x Lebar",
          "Panjang x Lebar x Tinggi",
          "Sisi x Sisi",
          "Sisi x Sisi x Sisi"
        ],
        correctAnswer: 3,
        explanation: "Volume kubus dihitung dengan mengalikan sisi sebanyak 3 kali (sisi³)."
      ),
      Question(
        question: "Apa perbedaan utama antara kubus dan balok?",
        options: [
          "Jumlah sisi",
          "Jumlah rusuk",
          "Panjang rusuk yang sama vs berbeda",
          "Jumlah titik sudut"
        ],
        correctAnswer: 2,
        explanation: "Perbedaan utama adalah kubus memiliki semua rusuk sama panjang, sedangkan balok memiliki rusuk dengan panjang yang dapat berbeda."
      ),
    ],
    2: [
      Question(
        question: "Apa yang dimaksud dengan visualisasi spasial?",
        options: [
          "Kemampuan melihat objek 2D",
          "Kemampuan memanipulasi objek dalam pikiran",
          "Kemampuan menggambar",
          "Kemampuan mengukur jarak"
        ],
        correctAnswer: 1,
        explanation: "Visualisasi spasial adalah kemampuan untuk memanipulasi dan membayangkan objek dalam pikiran."
      ),
      Question(
        question: "Bagaimana cara merotasi objek 3D dalam pikiran?",
        options: [
          "Menggunakan alat bantu",
          "Membayangkan objek dari berbagai sudut",
          "Menggambar objek",
          "Mengukur objek"
        ],
        correctAnswer: 1,
        explanation: "Merotasi objek 3D dalam pikiran dilakukan dengan membayangkan objek dari berbagai sudut pandang."
      ),
      Question(
        question: "Apa manfaat kemampuan visualisasi spasial?",
        options: [
          "Hanya untuk matematika",
          "Untuk menggambar saja",
          "Membantu dalam berbagai bidang",
          "Tidak ada manfaat"
        ],
        correctAnswer: 2,
        explanation: "Kemampuan visualisasi spasial bermanfaat dalam berbagai bidang seperti arsitektur, teknik, dan seni."
      ),
      Question(
        question: "Bagaimana cara meningkatkan kemampuan visualisasi spasial?",
        options: [
          "Membaca buku",
          "Latihan rutin dengan puzzle dan permainan",
          "Menghafal rumus",
          "Menulis"
        ],
        correctAnswer: 1,
        explanation: "Kemampuan visualisasi spasial dapat ditingkatkan melalui latihan rutin dengan puzzle dan permainan yang melibatkan manipulasi objek."
      ),
      Question(
        question: "Apa hubungan visualisasi spasial dengan geometri?",
        options: [
          "Tidak ada hubungan",
          "Hanya untuk menggambar",
          "Membantu pemahaman konsep geometri",
          "Hanya untuk mengukur"
        ],
        correctAnswer: 2,
        explanation: "Visualisasi spasial sangat membantu dalam pemahaman konsep geometri karena memungkinkan kita membayangkan bentuk dan ruang."
      ),
    ],
    3: [
      Question(
        question: "Apa yang dimaksud dengan koordinat?",
        options: [
          "Angka acak",
          "Posisi pada peta",
          "Pasangan nilai yang menunjukkan lokasi",
          "Jarak tempuh"
        ],
        correctAnswer: 2,
        explanation: "Koordinat adalah pasangan nilai yang menunjukkan lokasi spesifik pada sistem koordinat."
      ),
      Question(
        question: "Bagaimana cara menentukan lokasi pada bidang koordinat?",
        options: [
          "Menggunakan satu angka",
          "Menggunakan huruf",
          "Menggunakan pasangan (x,y)",
          "Menggunakan warna"
        ],
        correctAnswer: 2,
        explanation: "Lokasi pada bidang koordinat ditentukan menggunakan pasangan nilai (x,y) yang menunjukkan posisi horizontal dan vertikal."
      ),
      Question(
        question: "Apa fungsi sumbu x pada sistem koordinat?",
        options: [
          "Menunjukkan tinggi",
          "Menunjukkan posisi horizontal",
          "Menunjukkan waktu",
          "Menunjukkan warna"
        ],
        correctAnswer: 1,
        explanation: "Sumbu x pada sistem koordinat berfungsi untuk menunjukkan posisi horizontal (mendatar)."
      ),
      Question(
        question: "Bagaimana menentukan jarak antara dua titik?",
        options: [
          "Menebak",
          "Menggunakan rumus jarak",
          "Menghitung titik",
          "Mengukur dengan penggaris"
        ],
        correctAnswer: 1,
        explanation: "Jarak antara dua titik dapat ditentukan menggunakan rumus jarak antara dua titik pada bidang koordinat."
      ),
      Question(
        question: "Apa yang dimaksud dengan kuadran?",
        options: [
          "Bagian dari lingkaran",
          "Bagian dari bidang koordinat",
          "Jenis garis",
          "Jenis sudut"
        ],
        correctAnswer: 1,
        explanation: "Kuadran adalah bagian dari bidang koordinat yang dibagi oleh sumbu x dan y menjadi empat bagian."
      ),
    ],
  };
}