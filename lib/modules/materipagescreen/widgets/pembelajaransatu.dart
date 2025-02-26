import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pembelajaransatu extends StatelessWidget {
  const Pembelajaransatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.01),
      child: Expanded(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            // Section 1: Introduction to constructing and deconstructing
            Container(
              padding: EdgeInsets.all(16),
              width: Get.width * 0.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Mengonstruksi dan Mengurai Kubus dan Balok',
                    style: TextStyle(
                      fontSize: Get.width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Get.height * 0.015),
                  Text(
                    'Sebelum kita belajar lebih jauh tentang kubus dan balok, kita perlu memahami dua hal penting yaitu mengonstruksi dan mengurai.',
                    style: TextStyle(fontSize: Get.width * 0.04),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Card(
                    color: Colors.blue.shade50,
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.construction,
                                  color: Colors.blue.shade700),
                              SizedBox(width: 8),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontSize: Get.width * 0.04,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: 'Mengonstruksi ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text:
                                            'berarti membangun atau menyusun kubus dan balok dari bagian-bagiannya menjadi bentuk yang utuh.',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.grid_view,
                                  color: Colors.orange.shade700),
                              SizedBox(width: 8),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontSize: Get.width * 0.04,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: 'Mengurai ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text:
                                            'berarti membuka atau membongkar kubus dan balok menjadi bagian-bagiannya.',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),

            // Section 2: What are Cube and Cuboid
            Container(
              padding: EdgeInsets.all(16),
              width: Get.width * 0.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Apa itu Kubus dan Balok?',
                    style: TextStyle(
                      fontSize: Get.width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Get.height * 0.015),
                  Text(
                    'Sebelum kalian mengonstruksi dan mengurai kubus atau balok, kira-kira apa saja yang dapat disebut kubus dan balok? Apakah kubus dan balok ada disekitar kita?',
                    style: TextStyle(fontSize: Get.width * 0.04),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: Get.height * 0.015),
                  Card(
                    elevation: 0,
                    color: Colors.amber.shade50,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.lightbulb, color: Colors.amber),
                              SizedBox(width: 8),
                              Text(
                                'Contoh benda dalam kehidupan sehari-hari:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Get.width * 0.04,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('• ',
                                  style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      fontWeight: FontWeight.bold)),
                              Text('Kubus: ',
                                  style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      fontWeight: FontWeight.bold)),
                              Expanded(
                                child: Text(
                                  'Dadu, rubik, kotak makanan kecil.',
                                  style: TextStyle(fontSize: Get.width * 0.04),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('• ',
                                  style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      fontWeight: FontWeight.bold)),
                              Text('Balok: ',
                                  style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      fontWeight: FontWeight.bold)),
                              Expanded(
                                child: Text(
                                  'Kotak susu, buku, kardus sepatu.',
                                  style: TextStyle(fontSize: Get.width * 0.04),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Icon(Icons.casino,
                                  size: 60, color: Colors.blue),
                            ),
                          ),
                          Text('Dadu (Kubus)',
                              style: TextStyle(fontSize: Get.width * 0.035)),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Icon(Icons.inventory_2,
                                  size: 60, color: Colors.orange),
                            ),
                          ),
                          Text('Kotak Sepatu (Balok)',
                              style: TextStyle(fontSize: Get.width * 0.035)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.015),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue.shade300, width: 2),
                      color: Colors.blue.shade50,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.push_pin, color: Colors.red),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Coba perhatikan benda di sekitarmu! Apakah kamu bisa menemukan benda lain yang berbentuk kubus atau balok?',
                            style: TextStyle(
                                fontSize: Get.width * 0.04,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),

            // Section 3: Parts of Cube and Cuboid
            Container(
              padding: EdgeInsets.all(16),
              width: Get.width * 0.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Bagian-bagian yang Membentuk Kubus dan Balok',
                    style: TextStyle(
                      fontSize: Get.width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Get.height * 0.015),
                  Text(
                    'Setelah mengenali bentuknya, mari kita pelajari bagian-bagian yang membentuk kubus dan balok! Setiap kubus dan balok terdiri dari sisi, rusuk, dan titik sudut. Yuk, kita cari tahu lebih lanjut!',
                    style: TextStyle(fontSize: Get.width * 0.04),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: Get.height * 0.015),

                  // 3D Cube and Cuboid visualization
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Cube visualization placeholder
                      Column(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Transform(
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.001)
                                  ..rotateX(0.5)
                                  ..rotateY(0.5),
                                alignment: Alignment.center,
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.7),
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text('Kubus',
                              style: TextStyle(
                                  fontSize: Get.width * 0.038,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),

                      // Cuboid visualization placeholder
                      Column(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Transform(
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.001)
                                  ..rotateX(0.5)
                                  ..rotateY(0.5),
                                alignment: Alignment.center,
                                child: Container(
                                  height: 70,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.orange.withOpacity(0.7),
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text('Balok',
                              style: TextStyle(
                                  fontSize: Get.width * 0.038,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.02),

                  // Parts explanation - Sides
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.cyan.shade50,
                    ),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sisi',
                          style: TextStyle(
                            fontSize: Get.width * 0.042,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan.shade800,
                          ),
                        ),
                        Text(
                          'Sisi adalah permukaan datar yang membentuk kubus atau balok.',
                          style: TextStyle(fontSize: Get.width * 0.04),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ',
                                style: TextStyle(fontSize: Get.width * 0.04)),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: 'Kubus ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: 'memiliki '),
                                    TextSpan(
                                        text: '6 sisi ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: 'yang berbentuk '),
                                    TextSpan(
                                        text: 'persegi',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: '.'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ',
                                style: TextStyle(fontSize: Get.width * 0.04)),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: 'Balok ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: 'memiliki '),
                                    TextSpan(
                                        text: '6 sisi',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ', terdiri dari '),
                                    TextSpan(
                                        text: 'persegi panjang ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text:
                                            'dan mungkin ada yang berbentuk '),
                                    TextSpan(
                                        text: 'persegi',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: '.'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Card(
                          color: Colors.white,
                          elevation: 1,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Icon(Icons.lightbulb, color: Colors.amber),
                                SizedBox(width: 8),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                          fontSize: Get.width * 0.038,
                                          color: Colors.black),
                                      children: [
                                        TextSpan(text: 'Contoh nyata: '),
                                        TextSpan(
                                            text:
                                                'Pegang kotak bekal atau dadu. Sentuh permukaannya—itulah yang disebut '),
                                        TextSpan(
                                            text: 'sisi',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(text: '!'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.015),

                  // Parts explanation - Edges
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green.shade50,
                    ),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rusuk',
                          style: TextStyle(
                            fontSize: Get.width * 0.042,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade800,
                          ),
                        ),
                        Text(
                          'Rusuk adalah garis tepi yang menghubungkan sisi-sisi kubus atau balok.',
                          style: TextStyle(fontSize: Get.width * 0.04),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ',
                                style: TextStyle(fontSize: Get.width * 0.04)),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: 'Kubus ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: 'memiliki '),
                                    TextSpan(
                                        text: '12 rusuk yang panjangnya sama',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: '.'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ',
                                style: TextStyle(fontSize: Get.width * 0.04)),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: 'Balok ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: 'juga memiliki '),
                                    TextSpan(
                                        text: '12 rusuk',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ', tetapi bisa memiliki '),
                                    TextSpan(
                                        text: 'panjang yang berbeda',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: '.'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Card(
                          color: Colors.white,
                          elevation: 1,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Icon(Icons.lightbulb, color: Colors.amber),
                                SizedBox(width: 8),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                          fontSize: Get.width * 0.038,
                                          color: Colors.black),
                                      children: [
                                        TextSpan(text: 'Contoh nyata: '),
                                        TextSpan(text: 'Lihat bagian tepi '),
                                        TextSpan(
                                            text: 'buku atau kardus',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(text: '—itu adalah '),
                                        TextSpan(
                                            text: 'rusuk',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(text: '!'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.015),

                  // Parts explanation - Vertices
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.purple.shade50,
                    ),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Titik Sudut',
                          style: TextStyle(
                            fontSize: Get.width * 0.042,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple.shade800,
                          ),
                        ),
                        Text(
                          'Titik sudut adalah titik tempat bertemunya tiga rusuk.',
                          style: TextStyle(fontSize: Get.width * 0.04),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ',
                                style: TextStyle(fontSize: Get.width * 0.04)),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: 'Kubus dan balok ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: 'sama-sama memiliki '),
                                    TextSpan(
                                        text: '8 titik sudut',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: '.'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Card(
                          color: Colors.white,
                          elevation: 1,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Icon(Icons.lightbulb, color: Colors.amber),
                                SizedBox(width: 8),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                          fontSize: Get.width * 0.038,
                                          color: Colors.black),
                                      children: [
                                        TextSpan(text: 'Contoh nyata: '),
                                        TextSpan(
                                            text:
                                                'Perhatikan ujung dadu atau kardus—setiap sudut itulah yang disebut '),
                                        TextSpan(
                                            text: 'titik sudut',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(text: '!'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),

            // Section 4: Nets of Cube and Cuboid
            Container(
              padding: EdgeInsets.all(16),
              width: Get.width * 0.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Apa yang Terjadi Jika Kubus atau Balok Dibuka?',
                    style: TextStyle(
                      fontSize: Get.width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Get.height * 0.015),
                  Text(
                    'Ketika seluruh sisi kubus atau balok dibuka dan diratakan, bentuknya berubah menjadi jaring-jaring. Jaring-jaring adalah susunan bangun datar yang, jika dilipat kembali, bisa membentuk kubus atau balok.',
                    style: TextStyle(fontSize: Get.width * 0.04),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: Get.height * 0.015),
                  Card(
                    color: Colors.white,
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(Icons.lightbulb, color: Colors.amber),
                          SizedBox(width: 8),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: Get.width * 0.038,
                                    color: Colors.black),
                                children: [
                                  TextSpan(text: 'Contoh nyata: '),
                                  TextSpan(text: 'Saat kamu membuka '),
                                  TextSpan(
                                      text: 'kotak susu ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text:
                                          'dan meratakannya, kamu melihat pola sisi-sisinya berbentuk '),
                                  TextSpan(
                                      text: 'persegi panjang dan persegi',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: '. Itu adalah '),
                                  TextSpan(
                                      text: 'jaring-jaring balok',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: '!'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.015),

                  // Net Patterns Illustrations
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Cube net pattern
                      Column(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Icon(Icons.view_module,
                                  size: 80, color: Colors.blue),
                            ),
                          ),
                          Text('Jaring-jaring Kubus',
                              style: TextStyle(fontSize: Get.width * 0.035)),
                        ],
                      ),

                      // Cuboid net pattern
                      Column(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Icon(Icons.dashboard,
                                  size: 80, color: Colors.orange),
                            ),
                          ),
                          Text('Jaring-jaring Balok',
                              style: TextStyle(fontSize: Get.width * 0.035)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.015),

                  // Facts about net patterns
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.teal.shade50,
                    ),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Yang perlu kamu ketahui tentang jaring-jaring!',
                          style: TextStyle(
                            fontSize: Get.width * 0.042,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade800,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ',
                                style: TextStyle(fontSize: Get.width * 0.04)),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: 'Kubus ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: 'memiliki '),
                                    TextSpan(
                                        text:
                                            '11 kemungkinan bentuk jaring-jaring',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: '.'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ',
                                style: TextStyle(fontSize: Get.width * 0.04)),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: 'Balok ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: 'memiliki '),
                                    TextSpan(
                                        text: 'beragam jaring-jaring',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' yang terdiri dari '),
                                    TextSpan(
                                        text:
                                            '6 sisi berbentuk persegi panjang atau kombinasi persegi',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: '.'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ',
                                style: TextStyle(fontSize: Get.width * 0.04)),
                            Expanded(
                              child: Text(
                                'Jaring-jaring bisa dibuat dengan memotong dan melipat kembali suatu bentuk!',
                                style: TextStyle(fontSize: Get.width * 0.04),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),

            // Section 5: Combining Cubes and Cuboids
            Container(
              padding: EdgeInsets.all(16),
              width: Get.width * 0.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Bagaimana jika kita menggabungkan kubus atau balok?',
                    style: TextStyle(
                      fontSize: Get.width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Get.height * 0.015),
                  Text(
                    'Kubus dan balok bisa digabungkan untuk membentuk bangun ruang yang lebih besar.',
                    style: TextStyle(fontSize: Get.width * 0.04),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: Get.height * 0.015),

                  // Combining cubes
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade50, Colors.blue.shade100],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.lightbulb, color: Colors.amber),
                            SizedBox(width: 8),
                            Text(
                              'Fakta tentang Penggabungan Kubus:',
                              style: TextStyle(
                                fontSize: Get.width * 0.042,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ',
                                style: TextStyle(fontSize: Get.width * 0.04)),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(text: 'Jika kita menyusun '),
                                    TextSpan(
                                        text: 'dua kubus kecil berdampingan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: ', maka bentuknya akan menjadi '),
                                    TextSpan(
                                        text: 'balok ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: 'karena panjangnya bertambah.'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ',
                                style: TextStyle(fontSize: Get.width * 0.04)),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(text: 'Jika kita menyusun '),
                                    TextSpan(
                                        text: 'beberapa kubus ke atas',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ', kita bisa membentuk '),
                                    TextSpan(
                                        text: 'menara',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: '.'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ',
                                style: TextStyle(fontSize: Get.width * 0.04)),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(text: 'Jika kita menyusun '),
                                    TextSpan(
                                        text:
                                            'banyak kubus dalam pola tertentu',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ', kita bisa membentuk '),
                                    TextSpan(
                                        text:
                                            'bentuk bangunan yang lebih besar',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text:
                                            ', seperti dinding atau kotak besar.'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        // Example illustrations
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.push_pin, color: Colors.red),
                                  SizedBox(width: 5),
                                  Text(
                                    'Contoh nyata:',
                                    style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.check_circle,
                                      color: Colors.green, size: 20),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                            fontSize: Get.width * 0.038,
                                            color: Colors.black),
                                        children: [
                                          TextSpan(text: 'Jika kamu menyusun '),
                                          TextSpan(
                                              text: 'dadu berdampingan',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text:
                                                  ', kamu bisa melihat bentuk balok yang terbentuk!'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.check_circle,
                                      color: Colors.green, size: 20),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                            fontSize: Get.width * 0.038,
                                            color: Colors.black),
                                        children: [
                                          TextSpan(text: 'Jika kamu menumpuk '),
                                          TextSpan(
                                              text:
                                                  'kubus rubik satu di atas yang lain',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text:
                                                  ', kamu mendapatkan bentuk menara!'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.015),

                  // Illustration of combining cubes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 140,
                        width: Get.width * 0.85,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.view_in_ar,
                                      size: 40, color: Colors.blue),
                                  Icon(Icons.add, size: 20),
                                  Icon(Icons.view_in_ar,
                                      size: 40, color: Colors.blue),
                                ],
                              ),
                              Icon(Icons.arrow_forward, size: 30),
                              Transform(
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.001)
                                  ..rotateX(0.4)
                                  ..rotateY(0.4),
                                alignment: Alignment.center,
                                child: Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.7),
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.015),

                  // Combining cuboids
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [Colors.orange.shade50, Colors.orange.shade100],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.lightbulb, color: Colors.amber),
                            SizedBox(width: 8),
                            Text(
                              'Fakta tentang Penggabungan Balok:',
                              style: TextStyle(
                                fontSize: Get.width * 0.042,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange.shade800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ',
                                style: TextStyle(fontSize: Get.width * 0.04)),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(text: 'Jika kita menyusun '),
                                    TextSpan(
                                        text: 'dua balok secara berdampingan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text:
                                            ', kita bisa membuat bentuk yang lebih panjang.'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ',
                                style: TextStyle(fontSize: Get.width * 0.04)),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(text: 'Jika kita menyusun '),
                                    TextSpan(
                                        text: 'balok ke atas',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ', kita bisa membangun '),
                                    TextSpan(
                                        text: 'gedung bertingkat',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: '.'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ',
                                style: TextStyle(fontSize: Get.width * 0.04)),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(text: 'Jika kita menyusun '),
                                    TextSpan(
                                        text:
                                            'banyak balok dengan berbagai ukuran',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ', kita bisa membentuk '),
                                    TextSpan(
                                        text:
                                            'rumah, jembatan, atau bangunan lainnya',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: '.'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        // Example illustrations
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.push_pin, color: Colors.red),
                                  SizedBox(width: 5),
                                  Text(
                                    'Contoh nyata:',
                                    style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.check_circle,
                                      color: Colors.green, size: 20),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                            fontSize: Get.width * 0.038,
                                            color: Colors.black),
                                        children: [
                                          TextSpan(text: 'Jika kamu menumpuk '),
                                          TextSpan(
                                              text: 'kotak susu',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text:
                                                  ' satu di atas yang lain, itu menyerupai gedung bertingkat!'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.check_circle,
                                      color: Colors.green, size: 20),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                            fontSize: Get.width * 0.038,
                                            color: Colors.black),
                                        children: [
                                          TextSpan(text: 'Jika kamu menyusun '),
                                          TextSpan(
                                              text:
                                                  'balok kayu secara berjajar',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text:
                                                  ', kamu bisa membuat dinding!'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.015),

                  // Illustration of combining cuboids
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 140,
                        width: Get.width * 0.85,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Transform(
                                    transform: Matrix4.identity()
                                      ..setEntry(3, 2, 0.001)
                                      ..rotateX(0.4)
                                      ..rotateY(0.4),
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.orange.withOpacity(0.7),
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                      ),
                                    ),
                                  ),
                                  Transform(
                                    transform: Matrix4.identity()
                                      ..setEntry(3, 2, 0.001)
                                      ..rotateX(0.4)
                                      ..rotateY(0.4),
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.orange.withOpacity(0.7),
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_downward, size: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.home,
                                      size: 60, color: Colors.orange.shade700),
                                ],
                              ),
                              Text(
                                'Menyusun balok menjadi bangunan',
                                style: TextStyle(
                                  fontSize: Get.width * 0.035,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.03),

            // Conclusion/Summary section
            Container(
              padding: EdgeInsets.all(16),
              width: Get.width * 0.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Colors.blue.shade100, Colors.purple.shade100],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Yuk Kita Rangkum!',
                    style: TextStyle(
                      fontSize: Get.width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Get.height * 0.015),
                  Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Text(
                            '✨ Mengonstruksi adalah membangun kubus dan balok dari bagian-bagiannya.',
                            style: TextStyle(fontSize: Get.width * 0.04),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '✨ Mengurai adalah membongkar kubus dan balok menjadi bagian-bagiannya.',
                            style: TextStyle(fontSize: Get.width * 0.04),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '✨ Kubus dan balok terdiri dari sisi, rusuk, dan titik sudut.',
                            style: TextStyle(fontSize: Get.width * 0.04),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '✨ Jaring-jaring adalah bentuk kubus atau balok yang dibuka dan diratakan.',
                            style: TextStyle(fontSize: Get.width * 0.04),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '✨ Kita bisa menggabungkan kubus dan balok untuk membuat bentuk baru!',
                            style: TextStyle(fontSize: Get.width * 0.04),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.015),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.celebration, color: Colors.amber),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Sekarang kamu sudah memahami tentang mengonstruksi dan mengurai kubus dan balok. Coba lihat benda-benda di sekitarmu dan identifikasi mana yang berbentuk kubus dan balok!',
                            style: TextStyle(
                                fontSize: Get.width * 0.038,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.03),
          ],
        ),
      ),
    );
  }
}
