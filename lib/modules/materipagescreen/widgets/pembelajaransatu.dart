import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pembelajaransatu extends StatelessWidget {
  const Pembelajaransatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mengonstruksi dan Mengurai Kubus dan Balok',
            style: TextStyle(
              fontSize: Get.width * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: Get.height * 0.015),
          Text(
            'Kita mulai dengan memahami apa itu kubus dan balok. Pernahkah kamu melihat dadu?',
            style: TextStyle(fontSize: Get.width * 0.04),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: Get.height * 0.02),
          Text(
            'Itulah contoh kubus. '
            'Bagaimana dengan kotak sepatu? Itu adalah contoh balok. Sekarang, mari kita belajar lebih jauh tentang keduanya!',
            style: TextStyle(fontSize: Get.width * 0.04),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: Get.height * 0.02),
          Text(
            'Pengertian Kubus dan Balok',
            style: TextStyle(
                fontSize: Get.width * 0.045, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: Get.height * 0.015),
          Text(
            'Kubus adalah bangun ruang yang memiliki 6 sisi, dan semua sisi berbentuk persegi. Selain itu, panjang setiap sisinya selalu sama.',
            style: TextStyle(fontSize: Get.width * 0.04),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: Get.height * 0.015),
          Text(
            'Balok adalah bangun ruang yang juga memiliki 6 sisi, tetapi sisi-sisinya berbentuk persegi panjang. '
            'Pada balok, panjang, lebar, dan tingginya bisa berbeda-beda.',
            style: TextStyle(fontSize: Get.width * 0.04),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: Get.height * 0.02),
          Text(
            'Bagian-bagian Kubus dan Balok',
            style: TextStyle(
                fontSize: Get.width * 0.045, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: Get.height * 0.015),
          Text(
            'Sisi adalah bagian permukaan datar pada kubus atau balok. '
            'Kubus memiliki 6 sisi yang semuanya berbentuk persegi. '
            'Balok juga memiliki 6 sisi, tetapi biasanya tidak semuanya sama. '
            'Ada sisi panjang (panjang × tinggi) dan sisi lebar (lebar × tinggi).',
            style: TextStyle(fontSize: Get.width * 0.04),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: Get.height * 0.02),
          Text(
            'Rusuk adalah garis yang membentuk tepi kubus atau balok. '
            'Kubus memiliki 12 rusuk, dan semuanya sama panjang. '
            'Balok juga memiliki 12 rusuk, tetapi bisa ada yang panjang, pendek, atau sedang, '
            'tergantung pada ukuran panjang, lebar, dan tinggi balok.',
            style: TextStyle(fontSize: Get.width * 0.04),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: Get.height * 0.02),
          Text(
            'Titik sudut adalah tempat bertemunya 3 rusuk. '
            'Kubus dan balok memiliki 8 titik sudut.',
            style: TextStyle(fontSize: Get.width * 0.04),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: Get.height * 0.02),
          Text(
            'Mengonstruksi dan Mengurai',
            style: TextStyle(
                fontSize: Get.width * 0.045, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: Get.height * 0.015),
          Text(
            'Mengonstruksi artinya kita menyusun kubus atau balok dari bahan tertentu, misalnya dari kertas, kardus, atau balok mainan. '
            'Cobalah menyusun kubus dengan membuat 6 persegi yang sama dan menempelkannya menjadi satu bangun.',
            style: TextStyle(fontSize: Get.width * 0.04),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: Get.height * 0.015),
          Text(
            'Mengurai berarti kita membongkar kubus atau balok menjadi bagian-bagian kecil. Ketika kita membongkar kubus atau balok, '
            'kita bisa melihat sisi-sisi, rusuk, dan titik sudutnya dengan jelas.',
            style: TextStyle(fontSize: Get.width * 0.04),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: Get.height * 0.02),
        ],
      ),
    );
  }
}
