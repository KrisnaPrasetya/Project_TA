import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomheaderMateri extends StatelessWidget {
  final int args;

  const CustomheaderMateri({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height * 0.25,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1DE9B6), Color(0xFF64FFDA)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: Get.height * 0.06,
            left: Get.width * 0.04,
            right: Get.width * 0.04,
            child: Container(
              padding: EdgeInsets.all(16),
              height: Get.height * 0.15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  if (args == 0)
                    Text(
                      'Mengonstruksi dan Mengurai Kubus dan Balok',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  else if (args == 1)
                    Text(
                      'Visualisasi Spasial',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  else if (args == 2)
                    Text(
                      'Pengertian Tabung dan Kerucut',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
