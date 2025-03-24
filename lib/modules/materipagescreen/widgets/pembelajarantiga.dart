import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/materipagescreen/controller/audio_controller.dart';
import 'package:project_ta/modules/materipagescreen/widgets/video/video_player.dart';

class Pembelajarantiga extends StatelessWidget {
  const Pembelajarantiga({super.key});

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
              // Section 1: Introduction to Coordinate System
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
                            'Lokasi dan Koordinat dalam Sistem Berpetak',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GetBuilder<AudioController>(
                          builder: (controller) {
                            return IconButton(
                              icon: Icon(
                                controller.isPlaying[10] 
                                    ? Icons.volume_up
                                    : Icons.volume_off,
                                color: controller.isPlaying[10]
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                              onPressed: () => controller.toggleAudio(10),
                            );
                          }
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Text(
                      'Dalam sebuah peta atau bidang, kita perlu cara untuk menentukan posisi suatu objek. Sistem koordinat membantu kita menunjukkan lokasi dengan tepat.',
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
                                Icon(Icons.grid_on,
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
                                          text: 'Sistem Koordinat ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              'adalah cara untuk menentukan posisi suatu objek pada bidang menggunakan baris dan kolom.',
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

              // Section 2: Understanding the Coordinate System
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
                            'Memahami Sistem Koordinat',
                            style: TextStyle(
                              fontSize: Get.width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GetBuilder<AudioController>(
                          builder: (controller) {
                            return IconButton(
                              icon: Icon(
                                controller.isPlaying[11] 
                                    ? Icons.volume_up
                                    : Icons.volume_off,
                                color: controller.isPlaying[11]
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                              onPressed: () => controller.toggleAudio(11),
                            );
                          }
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Text(
                      'Dalam sistem koordinat, kita menggunakan baris (horizontal) dan kolom (vertikal) untuk menentukan posisi.',
                      style: TextStyle(fontSize: Get.width * 0.04),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Card(
                      elevation: 0,
                      color: Colors.green.shade50,
                      shadowColor: Colors.green.shade500,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bagian-bagian sistem koordinat:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Get.width * 0.04,
                              ),
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
                                  Text('Kolom: ',
                                      style: TextStyle(
                                          fontSize: Get.width * 0.04,
                                          fontWeight: FontWeight.bold)),
                                  Expanded(
                                    child: Text(
                                      'Diberi label dengan huruf (A, B, C, dst) dan berjalan secara vertikal.',
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
                                  Text('Baris: ',
                                      style: TextStyle(
                                          fontSize: Get.width * 0.04,
                                          fontWeight: FontWeight.bold)),
                                  Expanded(
                                    child: Text(
                                      'Diberi label dengan angka (1, 2, 3, dst) dan berjalan secara horizontal.',
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
                    Image.asset(
                      'assets/images/pembelajaran_tiga/koordinat.png',
                      width: Get.width * 0.8,
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.lightbulb, color: Colors.amber),
                              SizedBox(width: 8),
                              Text(
                                'Contoh dalam kehidupan sehari-hari:',
                                style: TextStyle(
                                  fontSize: Get.width * 0.042,
                                  fontWeight: FontWeight.bold,
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
                                child: Text(
                                  'Papan catur menggunakan sistem koordinat untuk menunjukkan posisi bidak.',
                                  style: TextStyle(fontSize: Get.width * 0.04),
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
                                  'Peta negara juga menggunakan grid koordinat untuk menentukan lokasi.',
                                  style: TextStyle(fontSize: Get.width * 0.04),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/pembelajaran_tiga/chess.png'),
                        ),
                      ),
                    ),
                    Text('Papan Catur',
                        style: TextStyle(fontSize: Get.width * 0.035)),
                    SizedBox(height: Get.height * 0.015),
                    Image.asset(
                      'assets/images/pembelajaran_tiga/map.png',
                    ),
                    Text('Peta Negara',
                        style: TextStyle(fontSize: Get.width * 0.035)),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.02),

              // Section 3: Determining Positions in Coordinates
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
                            'Cara Menentukan Posisi dalam Koordinat',
                            style: TextStyle(
                              fontSize: Get.width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GetBuilder<AudioController>(
                          builder: (controller) {
                            return IconButton(
                              icon: Icon(
                                controller.isPlaying[12] 
                                    ? Icons.volume_up
                                    : Icons.volume_off,
                                color: controller.isPlaying[12]
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                              onPressed: () => controller.toggleAudio(12),
                            );
                          }
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Text(
                      'Untuk menentukan posisi suatu objek atau berpindah ke lokasi tertentu dalam sistem koordinat, kita perlu memahami aturan pergerakan.',
                      style: TextStyle(fontSize: Get.width * 0.04),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: Get.height * 0.015),
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
                            'Pergerakan Horizontal (ke kanan atau ke kiri)',
                            style: TextStyle(
                              fontSize: Get.width * 0.042,
                              fontWeight: FontWeight.bold,
                              color: Colors.cyan.shade800,
                            ),
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
                                      TextSpan(text: 'Jika kita bergerak ke '),
                                      TextSpan(
                                          text: 'kanan',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(text: ', huruf kolom '),
                                      TextSpan(
                                          text: 'bertambah',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: ' (misalnya, dari C2 ke D2).'),
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
                                      TextSpan(text: 'Jika kita bergerak ke '),
                                      TextSpan(
                                          text: 'kiri',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(text: ', huruf kolom '),
                                      TextSpan(
                                          text: 'berkurang',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: ' (misalnya, dari D2 ke C2).'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.015),
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
                            'Pergerakan Vertikal (ke atas atau ke bawah)',
                            style: TextStyle(
                              fontSize: Get.width * 0.042,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple.shade800,
                            ),
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
                                      TextSpan(text: 'Jika kita bergerak ke '),
                                      TextSpan(
                                          text: 'atas',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(text: ', angka baris '),
                                      TextSpan(
                                          text: 'berkurang',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: ' (misalnya, dari C3 ke C2).'),
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
                                      TextSpan(text: 'Jika kita bergerak ke '),
                                      TextSpan(
                                          text: 'bawah',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(text: ', angka baris '),
                                      TextSpan(
                                          text: 'bertambah',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: ' (misalnya, dari C2 ke C3).'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Card(
                      color: Colors.blue.shade50,
                      elevation: 1,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.info, color: Colors.blue.shade700),
                                SizedBox(width: 8),
                                Text(
                                  'Penting untuk diingat:',
                                  style: TextStyle(
                                    fontSize: Get.width * 0.04,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Untuk menyatakan posisi, selalu sebutkan kolom (huruf) terlebih dahulu, kemudian baris (angka). Contoh: D4 berarti kolom D dan baris 4.',
                              style: TextStyle(fontSize: Get.width * 0.04),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.02),

              // Section 4: Distance in Coordinate System
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
                            'Menentukan Jarak dalam Sistem Koordinat',
                            style: TextStyle(
                              fontSize: Get.width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GetBuilder<AudioController>(
                          builder: (controller) {
                            return IconButton(
                              icon: Icon(
                                controller.isPlaying[13] 
                                    ? Icons.volume_up
                                    : Icons.volume_off,
                                color: controller.isPlaying[13]
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                              onPressed: () => controller.toggleAudio(13),
                            );
                          }
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Text(
                      'Jarak dalam sistem koordinat dihitung berdasarkan jumlah langkah yang dibutuhkan untuk berpindah dari satu titik ke titik lainnya.',
                      style: TextStyle(fontSize: Get.width * 0.04),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: Get.height * 0.015),
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
                            'Cara Menghitung Jarak:',
                            style: TextStyle(
                              fontSize: Get.width * 0.042,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade800,
                            ),
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
                                          text: 'Jarak horizontal ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text:
                                              'dihitung berdasarkan perbedaan kolom.'),
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
                                          text: 'Jarak vertikal ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text:
                                              'dihitung berdasarkan perbedaan baris.'),
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
                                          text: 'Jarak total ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text:
                                              'adalah jumlah langkah horizontal dan vertikal yang diperlukan untuk mencapai suatu titik.'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Card(
                      color: Colors.amber.shade50,
                      elevation: 1,
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
                                  'Contoh:',
                                  style: TextStyle(
                                    fontSize: Get.width * 0.042,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('• ',
                                    style:
                                        TextStyle(fontSize: Get.width * 0.04)),
                                Expanded(
                                  child: Text(
                                    'Jika seseorang berada di titik A2 dan ingin menuju C2, ia harus bergerak 2 langkah ke bawah.',
                                    style:
                                        TextStyle(fontSize: Get.width * 0.04),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('• ',
                                    style:
                                        TextStyle(fontSize: Get.width * 0.04)),
                                Expanded(
                                  child: Text(
                                    'Jika seseorang berada di titik B4 dan ingin menuju B7, ia harus bergerak 3 langkah ke bawah.',
                                    style:
                                        TextStyle(fontSize: Get.width * 0.04),
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
                      VideoPlayerWidget(assetPath: "assets/videos/menkontruksi.mp4"),
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
                    // Title row with audio button
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Yuk Kita Rangkum!',
                            style: TextStyle(
                              fontSize: Get.width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GetBuilder<AudioController>(
                          builder: (controller) {
                            return IconButton(
                              icon: Icon(
                                controller.isPlaying[14] 
                                    ? Icons.volume_up
                                    : Icons.volume_off,
                                color: controller.isPlaying[14]
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                              onPressed: () => controller.toggleAudio(14),
                            );
                          }
                        ),
                      ],
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
                                    'Sistem koordinat terdiri dari kolom (huruf) dan baris (angka).',
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
                                    'Untuk menentukan posisi, selalu sebutkan kolom dahulu, baru baris (contoh: D4).',
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
                                    'Pergerakan horizontal: ke kanan (huruf bertambah), ke kiri (huruf berkurang).',
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
                                    'Pergerakan vertikal: ke atas (angka berkurang), ke bawah (angka bertambah).',
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
                                    'Jarak total adalah jumlah langkah horizontal dan vertikal yang diperlukan.',
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
                              'Sekarang kamu sudah memahami sistem koordinat dan bagaimana cara menggunakannya. Coba terapkan pengetahuanmu dalam kehidupan sehari-hari!',
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