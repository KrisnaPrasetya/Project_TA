import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/materipagescreen/controller/audio_controller.dart';
import 'package:project_ta/modules/materipagescreen/widgets/video/video_player.dart';
import 'package:project_ta/modules/materipagescreen/widgets/video/video_player_repeat.dart';

class Pembelajaransatu extends StatelessWidget {
  const Pembelajaransatu({super.key});

  @override
  Widget build(BuildContext context) {
    final audioController = Get.put(AudioController());
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.01),
      child: Column(
        children: [
          ListView(
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
                    // Title row with audio button
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Mengonstruksi dan Mengurai Kubus dan Balok',
                            style: TextStyle(
                              fontSize: Get.width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GetBuilder<AudioController>(builder: (controller) {
                          return IconButton(
                            icon: Icon(
                              controller.isPlaying[0]
                                  ? Icons.volume_up
                                  : Icons.volume_off,
                              color: controller.isPlaying[0]
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            onPressed: () => controller.toggleAudio(0),
                          );
                        }),
                      ],
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
                    // Title row with audio button
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Apa itu Kubus dan Balok?',
                            style: TextStyle(
                              fontSize: Get.width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GetBuilder<AudioController>(builder: (controller) {
                          return IconButton(
                            icon: Icon(
                              controller.isPlaying[1]
                                  ? Icons.volume_up
                                  : Icons.volume_off,
                              color: controller.isPlaying[1]
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            onPressed: () => controller.toggleAudio(1),
                          );
                        }),
                      ],
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
                      shadowColor: Colors.amber.shade500,
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
                                  'Contoh benda dalam kehidupan\nsehari-hari:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Get.width * 0.04,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsetsDirectional.only(start: 10),
                              child: Row(
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
                                      style:
                                          TextStyle(fontSize: Get.width * 0.04),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(start: 10),
                              child: Row(
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
                                      style:
                                          TextStyle(fontSize: Get.width * 0.04),
                                    ),
                                  ),
                                ],
                              ),
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
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/pembelajaran_satu/dadu.png'),
                                  fit: BoxFit.cover,
                                ),
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
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/pembelajaran_satu/kotak_sepatu.png'),
                                  fit: BoxFit.cover,
                                ),
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
                        border:
                            Border.all(color: Colors.blue.shade300, width: 2),
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
                    // Title row with audio button
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Bagian-bagian yang Membentuk Kubus dan Balok',
                            style: TextStyle(
                              fontSize: Get.width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GetBuilder<AudioController>(builder: (controller) {
                          return IconButton(
                            icon: Icon(
                              controller.isPlaying[2]
                                  ? Icons.volume_up
                                  : Icons.volume_off,
                              color: controller.isPlaying[2]
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            onPressed: () => controller.toggleAudio(2),
                          );
                        }),
                      ],
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
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/pembelajaran_satu/kubus.png'),
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
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/pembelajaran_satu/balok.png'),
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
                    // Title row with audio button
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Apa yang Terjadi Jika Kubus atau Balok Dibuka?',
                            style: TextStyle(
                              fontSize: Get.width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GetBuilder<AudioController>(builder: (controller) {
                          return IconButton(
                            icon: Icon(
                              controller.isPlaying[3]
                                  ? Icons.volume_up
                                  : Icons.volume_off,
                              color: controller.isPlaying[3]
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            onPressed: () => controller.toggleAudio(3),
                          );
                        }),
                      ],
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: VideoThumbnail(
                                  videoAsset: 'assets/videos/kubus.mp4',
                                  thumbnailAsset:
                                      'assets/images/pembelajaran_satu/kubus.png',
                                  label: 'Jaring - jaring Kubus 1',
                                  playbackSpeed: 0.5,
                                  height: 120, // Explicit height
                                  showGuide: true,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: VideoThumbnail(
                                  videoAsset: 'assets/videos/kubus2.mp4',
                                  thumbnailAsset:
                                      'assets/images/pembelajaran_satu/kubus.png',
                                  label: 'Jaring - jaring Kubus 2',
                                  playbackSpeed: 0.5,
                                  height: 120, // Explicit height
                                  showGuide: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text('Jaring-jaring Kubus',
                            style: TextStyle(fontSize: Get.width * 0.035)),
                        const SizedBox(height: 12),

                        // Cuboid net pattern
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: VideoThumbnail(
                                  videoAsset: 'assets/videos/balok1.mp4',
                                  thumbnailAsset:
                                      'assets/images/pembelajaran_satu/balok.png',
                                  label: 'Jaring - jaring Balok 1',
                                  playbackSpeed: 0.5,
                                  height: 120,
                                  showGuide: true, // Explicit height
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: VideoThumbnail(
                                  videoAsset: 'assets/videos/balok2.mp4',
                                  thumbnailAsset:
                                      'assets/images/pembelajaran_satu/balok.png',
                                  label: 'Jaring - jaring Balok 2',
                                  playbackSpeed: 0.5,
                                  height: 120, // Explicit height
                                  showGuide: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text('Jaring-jaring Balok',
                            style: TextStyle(fontSize: Get.width * 0.035)),
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
                    // Title row with audio button
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Bagaimana jika kita menggabungkan kubus atau balok?',
                            style: TextStyle(
                              fontSize: Get.width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GetBuilder<AudioController>(builder: (controller) {
                          return IconButton(
                            icon: Icon(
                              controller.isPlaying[4]
                                  ? Icons.volume_up
                                  : Icons.volume_off,
                              color: controller.isPlaying[4]
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            onPressed: () => controller.toggleAudio(4),
                          );
                        }),
                      ],
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
                                          text:
                                              ', maka bentuknya akan menjadi '),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            TextSpan(
                                                text: 'Jika kamu menyusun '),
                                            TextSpan(
                                                text: 'dadu berdampingan',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text:
                                                    ', kamu bisa melihat bentuk balok yang terbentuk!'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            TextSpan(
                                                text: 'Jika kamu menumpuk '),
                                            TextSpan(
                                                text:
                                                    'kubus rubik satu di atas yang lain',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
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
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/pembelajaran_satu/duad_dadu.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/pembelajaran_satu/menara_dadu.png'),
                              fit: BoxFit.cover,
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
                          colors: [
                            Colors.orange.shade50,
                            Colors.orange.shade100
                          ],
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            TextSpan(
                                                text: 'Jika kamu menumpuk '),
                                            TextSpan(
                                                text: 'kotak susu',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text:
                                                    ' satu di atas yang lain, itu menyerupai gedung bertingkat!'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            TextSpan(
                                                text: 'Jika kamu menyusun '),
                                            TextSpan(
                                                text:
                                                    'balok kayu secara berjajar',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
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
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              Text(
                'Video pembelajaran',
                style: TextStyle(
                  fontSize: Get.width * 0.045,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child:
                      VideoPlayerWidget(assetPath: "assets/videos/kubus.mp4"),
                ),
              ),
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
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '✨',
                                  style: TextStyle(fontSize: Get.width * 0.04),
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    'Mengonstruksi adalah membangun kubus dan balok dari bagian-bagiannya.',
                                    style:
                                        TextStyle(fontSize: Get.width * 0.04),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '✨',
                                  style: TextStyle(fontSize: Get.width * 0.04),
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    'Mengurai adalah membongkar kubus dan balok menjadi bagian-bagiannya.',
                                    style:
                                        TextStyle(fontSize: Get.width * 0.04),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '✨',
                                  style: TextStyle(fontSize: Get.width * 0.04),
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    'Jaring-jaring adalah bentuk kubus atau balok yang dibuka dan diratakan.',
                                    style:
                                        TextStyle(fontSize: Get.width * 0.04),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '✨',
                                  style: TextStyle(fontSize: Get.width * 0.04),
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    'Kita bisa menggabungkan kubus dan balok untuk membuat bentuk baru!',
                                    style:
                                        TextStyle(fontSize: Get.width * 0.04),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
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
        ],
      ),
    );
  }
}
