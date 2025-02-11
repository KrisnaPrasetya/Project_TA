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
          "A. Persegi membentuk kubus",
          "B. Garis yang membentuk kubus",
          "C. Titik sudut kubus",
          "D. Sisi kubus"
        ],
        correctAnswer: 0,
        explanation: "Jaring-jaring kubus adalah rangkaian persegi yang jika dilipat akan membentuk kubus."
      ),
      Question(
        question: "Berapa jumlah sisi pada sebuah balok?",
        options: ["A. 4 sisi", "B. 6 sisi", "C. 8 sisi", "D. 12 sisi"],
        correctAnswer: 1,
        explanation: "Balok memiliki 6 sisi yang terdiri dari 3 pasang sisi yang berhadapan."
      ),
      Question(
        question: "Apa ciri khas dari kubus?",
        options: [
          "A. Semua sisinya berbeda",
          "B. Memiliki 12 rusuk sama panjang",
          "C. Memiliki 4 sisi",
          "D. Memiliki 8 titik sudut"
        ],
        correctAnswer: 1,
        explanation: "Kubus memiliki 12 rusuk yang sama panjang sebagai salah satu ciri khasnya."
      ),
      Question(
        question: "Bagaimana cara menghitung volume kubus?",
        options: [
          "A. Panjang x Lebar",
          "B. Panjang x Lebar x Tinggi",
          "C. Sisi x Sisi",
          "D. Sisi x Sisi x Sisi"
        ],
        correctAnswer: 3,
        explanation: "Volume kubus dihitung dengan mengalikan sisi sebanyak 3 kali (sisi³)."
      ),
      Question(
        question: "Apa perbedaan utama antara kubus dan balok?",
        options: [
          "A. Jumlah sisi",
          "B. Jumlah rusuk",
          "C. Panjang rusuk yang sama vs berbeda",
          "D. Jumlah titik sudut"
        ],
        correctAnswer: 2,
        explanation: "Perbedaan utama adalah kubus memiliki semua rusuk sama panjang, sedangkan balok memiliki rusuk dengan panjang yang dapat berbeda."
      ),
    ],
    2: [
      Question(
        question: "Apa yang dimaksud dengan visualisasi spasial?",
        options: [
          "A. Kemampuan melihat objek 2D",
          "B. Kemampuan memanipulasi objek dalam pikiran",
          "C. Kemampuan menggambar",
          "D. Kemampuan mengukur jarak"
        ],
        correctAnswer: 1,
        explanation: "Visualisasi spasial adalah kemampuan untuk memanipulasi dan membayangkan objek dalam pikiran."
      ),
      Question(
        question: "Bagaimana cara merotasi objek 3D dalam pikiran?",
        options: [
          "A. Menggunakan alat bantu",
          "B. Membayangkan objek dari berbagai sudut",
          "C. Menggambar objek",
          "D. Mengukur objek"
        ],
        correctAnswer: 1,
        explanation: "Merotasi objek 3D dalam pikiran dilakukan dengan membayangkan objek dari berbagai sudut pandang."
      ),
      Question(
        question: "Apa manfaat kemampuan visualisasi spasial?",
        options: [
          "A. Hanya untuk matematika",
          "B. Untuk menggambar saja",
          "C. Membantu dalam berbagai bidang",
          "D. Tidak ada manfaat"
        ],
        correctAnswer: 2,
        explanation: "Kemampuan visualisasi spasial bermanfaat dalam berbagai bidang seperti arsitektur, teknik, dan seni."
      ),
      Question(
        question: "Bagaimana cara meningkatkan kemampuan visualisasi spasial?",
        options: [
          "A. Membaca buku",
          "B. Latihan rutin dengan puzzle dan permainan",
          "C. Menghafal rumus",
          "D. Menulis"
        ],
        correctAnswer: 1,
        explanation: "Kemampuan visualisasi spasial dapat ditingkatkan melalui latihan rutin dengan puzzle dan permainan yang melibatkan manipulasi objek."
      ),
      Question(
        question: "Apa hubungan visualisasi spasial dengan geometri?",
        options: [
          "A. Tidak ada hubungan",
          "B. Hanya untuk menggambar",
          "C. Membantu pemahaman konsep geometri",
          "D. Hanya untuk mengukur"
        ],
        correctAnswer: 2,
        explanation: "Visualisasi spasial sangat membantu dalam pemahaman konsep geometri karena memungkinkan kita membayangkan bentuk dan ruang."
      ),
    ],
    3: [
      Question(
        question: "Apa yang dimaksud dengan koordinat?",
        options: [
          "A. Angka acak",
          "B. Posisi pada peta",
          "C. Pasangan nilai yang menunjukkan lokasi",
          "D. Jarak tempuh"
        ],
        correctAnswer: 2,
        explanation: "Koordinat adalah pasangan nilai yang menunjukkan lokasi spesifik pada sistem koordinat."
      ),
      Question(
        question: "Bagaimana cara menentukan lokasi pada bidang koordinat?",
        options: [
          "A. Menggunakan satu angka",
          "B. Menggunakan huruf",
          "C. Menggunakan pasangan (x,y)",
          "D. Menggunakan warna"
        ],
        correctAnswer: 2,
        explanation: "Lokasi pada bidang koordinat ditentukan menggunakan pasangan nilai (x,y) yang menunjukkan posisi horizontal dan vertikal."
      ),
      Question(
        question: "Apa fungsi sumbu x pada sistem koordinat?",
        options: [
          "A. Menunjukkan tinggi",
          "B. Menunjukkan posisi horizontal",
          "C. Menunjukkan waktu",
          "D. Menunjukkan warna"
        ],
        correctAnswer: 1,
        explanation: "Sumbu x pada sistem koordinat berfungsi untuk menunjukkan posisi horizontal (mendatar)."
      ),
      Question(
        question: "Bagaimana menentukan jarak antara dua titik?",
        options: [
          "A. Menebak",
          "B. Menggunakan rumus jarak",
          "C. Menghitung titik",
          "D. Mengukur dengan penggaris"
        ],
        correctAnswer: 1,
        explanation: "Jarak antara dua titik dapat ditentukan menggunakan rumus jarak antara dua titik pada bidang koordinat."
      ),
      Question(
        question: "Apa yang dimaksud dengan kuadran?",
        options: [
          "A. Bagian dari lingkaran",
          "B. Bagian dari bidang koordinat",
          "C. Jenis garis",
          "D. Jenis sudut"
        ],
        correctAnswer: 1,
        explanation: "Kuadran adalah bagian dari bidang koordinat yang dibagi oleh sumbu x dan y menjadi empat bagian."
      ),
    ],
  };
}