import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/materipagescreen/controller/audio_controller.dart';
import 'package:project_ta/modules/materipagescreen/widgets/balok.dart';
import 'package:project_ta/modules/materipagescreen/widgets/cube.dart';
import 'package:project_ta/modules/materipagescreen/widgets/video/video_player.dart';

class Pembelajarandua extends StatelessWidget {
  const Pembelajarandua({super.key});

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
              // Section 1: Introduction to Spatial Visualization
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
                            'Visualisasi Spasial',
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
                                controller.isPlaying[5] 
                                    ? Icons.volume_up
                                    : Icons.volume_off,
                                color: controller.isPlaying[5]
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                              onPressed: () => controller.toggleAudio(5),
                            );
                          }
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Text(
                      'Ketika kita melihat sebuah benda, bentuknya bisa berubah tergantung dari arah mana kita melihatnya. Hal ini juga terjadi pada kubus dan balok, yang dapat terlihat berbeda jika dilihat dari berbagai arah atau diputar. Selain itu, jika kita memotong kubus atau balok, bentuknya juga akan berubah tergantung bagaimana cara kita memotongnya.',
                      style: TextStyle(fontSize: Get.width * 0.04),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.02),

              // Section 2: Different Views of Cube and Cuboid
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
                            'Bagaimana Kubus dan Balok Terlihat dari Berbagai Sudut?',
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
                                controller.isPlaying[6] 
                                    ? Icons.volume_up
                                    : Icons.volume_off,
                                color: controller.isPlaying[6]
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                              onPressed: () => controller.toggleAudio(6),
                            );
                          }
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.015),

                    // Cube views
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue.shade50,
                      ),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jika kita melihat kubus dari berbagai sudut:',
                            style: TextStyle(
                              fontSize: Get.width * 0.042,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade800,
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
                                      TextSpan(text: 'Dari '),
                                      TextSpan(
                                          text: 'atas',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(text: ' → terlihat seperti '),
                                      TextSpan(
                                          text: 'persegi',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                      TextSpan(text: 'Dari '),
                                      TextSpan(
                                          text: 'depan',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(text: ' → terlihat seperti '),
                                      TextSpan(
                                          text: 'persegi',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                      TextSpan(text: 'Dari '),
                                      TextSpan(
                                          text: 'sudut miring',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: ' → bisa terlihat seperti '),
                                      TextSpan(
                                          text: 'dua persegi bertumpuk',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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

                    // Cuboid views
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.orange.shade50,
                      ),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jika kita melihat balok dari berbagai sudut:',
                            style: TextStyle(
                              fontSize: Get.width * 0.042,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange.shade800,
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
                                      TextSpan(text: 'Dari '),
                                      TextSpan(
                                          text: 'atas',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(text: ' → terlihat seperti '),
                                      TextSpan(
                                          text: 'persegi panjang',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                      TextSpan(text: 'Dari '),
                                      TextSpan(
                                          text: 'samping',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(text: ' → terlihat seperti '),
                                      TextSpan(
                                          text: 'persegi panjang',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                      TextSpan(text: 'Dari '),
                                      TextSpan(
                                          text: 'depan',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(text: ' → terlihat seperti '),
                                      TextSpan(
                                          text: 'persegi panjang',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                      elevation: 0,
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
                                  'Contoh nyata:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Get.width * 0.04,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsetsDirectional.only(start: 10),
                              child: Text(
                                'Lihat kotak bekal atau kardus dari berbagai arah—bentuknya berubah tergantung sudut pandang kita!',
                                style: TextStyle(fontSize: Get.width * 0.04),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.02),

              // Section 3: Rotating Cube and Cuboid
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
                            'Bagaimana Kubus dan Balok Diputar?',
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
                                controller.isPlaying[7] 
                                    ? Icons.volume_up
                                    : Icons.volume_off,
                                color: controller.isPlaying[7]
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                              onPressed: () => controller.toggleAudio(7),
                            );
                          }
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Text(
                      'Ketika kita memutar kubus atau balok, bentuk yang kita lihat bisa berubah.',
                      style: TextStyle(fontSize: Get.width * 0.04),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: Get.height * 0.015),

                    // Rotating Cube
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue.shade50,
                      ),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.rotate_right, color: Colors.blue),
                              SizedBox(width: 8),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontSize: Get.width * 0.04,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(text: 'Jika kita memutar '),
                                      TextSpan(
                                          text: 'kubus',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text:
                                              ', bentuknya tetap terlihat persegi, karena semua sisinya sama besar.'),
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

                    // Rotating Cuboid
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.orange.shade50,
                      ),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.rotate_right, color: Colors.orange),
                              SizedBox(width: 8),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontSize: Get.width * 0.04,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(text: 'Jika kita memutar '),
                                      TextSpan(
                                          text: 'balok',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text:
                                              ', bentuknya bisa berubah tergantung arah putarannya. Misalnya:'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 16, end: 16),
                      child: Column(
                        children: [
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
                                      TextSpan(text: 'Jika dilihat dari '),
                                      TextSpan(
                                          text: 'depan atau samping langsung',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text:
                                              ', balok terlihat seperti persegi panjang.'),
                                    ],
                                  ),
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
                                      TextSpan(text: 'Jika dilihat dari '),
                                      TextSpan(
                                          text:
                                              'sudut miring atau diputar sedikit',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text:
                                              ', balok bisa terlihat lebih pendek atau lebih panjang, tetapi masih berbentuk persegi panjang.'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.yellow.shade200,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Cobalah putar kubus atau balok di bawah ini',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 18),
                          // Illustrations for rotating cube and cuboid
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Rotating Cube illustration
                              Column(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: InteractiveCube(),
                                  ),
                                  const SizedBox(height: 5),
                                  Text('Kubus',
                                      style: TextStyle(
                                          fontSize: Get.width * 0.035)),
                                ],
                              ),

                              // Rotating Cuboid illustration
                              Column(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: InteractiveBalok(),
                                  ),
                                  const SizedBox(height: 5),
                                  Text('Balok',
                                      style: TextStyle(
                                          fontSize: Get.width * 0.035)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Card(
                      color: Colors.amber.shade50,
                      elevation: 0,
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
                                  'Contoh nyata:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Get.width * 0.04,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsetsDirectional.only(start: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('📌 ',
                                      style: TextStyle(
                                        fontSize: Get.width * 0.04,
                                      )),
                                  Expanded(
                                    child: Text(
                                      'Ambil dadu dan putar ke berbagai arah—apakah bentuknya berubah?',
                                      style:
                                          TextStyle(fontSize: Get.width * 0.04),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: EdgeInsetsDirectional.only(start: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('📌 ',
                                      style: TextStyle(
                                        fontSize: Get.width * 0.04,
                                      )),
                                  Expanded(
                                    child: Text(
                                      'Ambil kotak susu dan coba putar ke samping—bagaimana bentuknya sekarang?',
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
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.02),

              // Section 4: Cutting Cube and Cuboid
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
                            'Apa bentuk yang terlihat jika kita memotong kubus dan balok?',
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
                                controller.isPlaying[8] 
                                    ? Icons.volume_up
                                    : Icons.volume_off,
                                color: controller.isPlaying[8]
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                              onPressed: () => controller.toggleAudio(8),
                            );
                          }
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Text(
                      'Ketika kita memotong kubus atau balok, bentuk yang dihasilkan tergantung pada arah potongannya. Kita akan mencoba untuk melihat bentuk potongan kubus dan balok dari berbagai arah.',
                      style: TextStyle(fontSize: Get.width * 0.04),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: Get.height * 0.015),

                    // Cutting Cube
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue.shade50,
                      ),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('🔹',
                                  style: TextStyle(
                                    fontSize: Get.width * 0.045,
                                    color: Colors.blue.shade700,
                                  )),
                              SizedBox(width: 8),
                              Text(
                                'Memotong Kubus',
                                style: TextStyle(
                                  fontSize: Get.width * 0.042,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade800,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),

                          // Horizontal cut
                          Text(
                            'Memotong kubus secara horizontal',
                            style: TextStyle(
                              fontSize: Get.width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
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
                                          text:
                                              'Jika kita memotong kubus secara horizontal menjadi dua bagian sama besar, kita akan mendapatkan '),
                                      TextSpan(
                                          text: 'dua kubus kecil yang identik',
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
                                  'Ini sering terjadi saat kita memotong blok es batu menjadi dua bagian yang lebih kecil.',
                                  style: TextStyle(fontSize: Get.width * 0.04),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),

                          // Diagonal cut
                          Text(
                            'Memotong kubus secara miring',
                            style: TextStyle(
                              fontSize: Get.width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
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
                                          text:
                                              'Jika kita memotong kubus secara miring, hasilnya bisa berupa '),
                                      TextSpan(
                                          text:
                                              'prisma segitiga atau trapesium',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text:
                                              ', tergantung arah potongannya.'),
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
                                  'Contoh potongan ini sering kita temui pada potongan sabun batangan atau potongan keju berbentuk kubus.',
                                  style: TextStyle(fontSize: Get.width * 0.04),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),

                          // Example
                          Card(
                            color: Colors.white,
                            elevation: 1,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.lightbulb,
                                          color: Colors.amber),
                                      SizedBox(width: 8),
                                      Text(
                                        'Contoh nyata:',
                                        style: TextStyle(
                                          fontSize: Get.width * 0.04,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('📌 ',
                                            style: TextStyle(
                                              fontSize: Get.width * 0.04,
                                            )),
                                        Expanded(
                                          child: Text(
                                            'Jika kamu membelah es batu berbentuk kubus menjadi dua bagian yang sama, maka kamu mendapatkan dua kubus kecil!',
                                            style: TextStyle(
                                                fontSize: Get.width * 0.038),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('📌 ',
                                            style: TextStyle(
                                              fontSize: Get.width * 0.04,
                                            )),
                                        Expanded(
                                          child: Text(
                                            'Jika kamu memotong keju berbentuk kubus secara miring, maka bentuknya bisa berubah menjadi prisma segitiga atau trapesium!',
                                            style: TextStyle(
                                                fontSize: Get.width * 0.038),
                                          ),
                                        ),
                                      ],
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

                    // Cutting Cuboid
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.orange.shade50,
                      ),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('🔹',
                                  style: TextStyle(
                                    fontSize: Get.width * 0.045,
                                    color: Colors.orange.shade700,
                                  )),
                              SizedBox(width: 8),
                              Text(
                                'Memotong Balok',
                                style: TextStyle(
                                  fontSize: Get.width * 0.042,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange.shade800,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),

                          // Rest of cutting cuboid content
                          // ...
                          
                          // Diagonal cut
                          Text(
                            'Memotong balok secara diagonal (dari ujung ke ujung)',
                            style: TextStyle(
                              fontSize: Get.width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
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
                                          text:
                                              'Jika kita memotong balok secara diagonal dari sudut ke sudut, hasilnya adalah '),
                                      TextSpan(
                                          text: 'prisma segitiga',
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
                                  'Bentuk ini sering kita temui pada atap rumah berbentuk segitiga atau potongan balok kayu untuk kerangka bangunan.',
                                  style: TextStyle(fontSize: Get.width * 0.04),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),

                          // Horizontal cut
                          Text(
                            'Memotong balok secara horizontal',
                            style: TextStyle(
                              fontSize: Get.width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
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
                                          text:
                                              'Jika kita memotong balok secara horizontal, maka kita akan mendapatkan '),
                                      TextSpan(
                                          text:
                                              'dua balok lebih kecil dengan ukuran yang sama',
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
                                  'Contoh potongan ini sering kita temui saat membelah bata atau balok kayu menjadi dua bagian.',
                                  style: TextStyle(fontSize: Get.width * 0.04),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),

                          // Example
                          Card(
                            color: Colors.white,
                            elevation: 1,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.lightbulb,
                                          color: Colors.amber),
                                      SizedBox(width: 8),
                                      Text(
                                        'Contoh nyata:',
                                        style: TextStyle(
                                          fontSize: Get.width * 0.04,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('📌 ',
                                            style: TextStyle(
                                              fontSize: Get.width * 0.04,
                                            )),
                                        Expanded(
                                          child: Text(
                                            'Potong bata atau balok kayu menjadi dua bagian bentuknya tetap balok tetapi lebih kecil!',
                                            style: TextStyle(
                                                fontSize: Get.width * 0.038),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('📌 ',
                                            style: TextStyle(
                                              fontSize: Get.width * 0.04,
                                            )),
                                        Expanded(
                                          child: Text(
                                            'Jika kamu memotong balok kayu secara diagonal dari sudut ke sudut, maka bentuknya akan berubah menjadi prisma segitiga!',
                                            style: TextStyle(
                                                fontSize: Get.width * 0.038),
                                          ),
                                        ),
                                      ],
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
                      VideoPlayerWidget(assetPath: "assets/videos/visualisasi_sparsial.mp4"),
                ),
              ),
              // Summary section
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
                                controller.isPlaying[9] 
                                    ? Icons.volume_up
                                    : Icons.volume_off,
                                color: controller.isPlaying[9]
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                              onPressed: () => controller.toggleAudio(9),
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
                                const SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    'Kubus dan balok dapat terlihat berbeda tergantung dari sudut pandang kita melihatnya.',
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
                                const SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    'Kubus terlihat seperti persegi jika dilihat dari atas atau depan.',
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
                                  '✨.',
                                  style: TextStyle(fontSize: Get.width * 0.04),
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    'Balok terlihat seperti persegi panjang jika dilihat dari atas, samping, atau depan.',
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
                                const SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    'Saat diputar, kubus tetap terlihat sama, sementara balok dapat terlihat berbeda tergantung arah putarannya.',
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
                                const SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    'Memotong kubus dan balok dapat menghasilkan bentuk berbeda seperti prisma segitiga atau trapesium.',
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
                              'Sekarang kamu sudah memahami tentang visualisasi spasial kubus dan balok. Coba perhatikan benda-benda berbentuk kubus dan balok di sekitarmu, lalu amati bentuknya dari berbagai sudut pandang!',
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