import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomheaderMateri extends StatelessWidget {
  final int args;

  const CustomheaderMateri({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height * 0.17,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF009CE1), Color(0xFF006AB5)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Get.height * 0.05),
          Row(
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios,
                    size: 25, color: Colors.white),
              ),
              Text(
                'Kembali',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Spacer(),
          Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.02, vertical: Get.height * 0.01),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 97, 174, 236),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24)),
            ),
            child: Center(
              child: Text(
                _getTitle(args),
                style: TextStyle(
                  fontSize: 16, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                maxLines: 2, // ✅ Allows wrapping to second line
                softWrap: true, // ✅ Ensures wrapping
                textAlign: TextAlign.center, // ✅ Aligns text properly
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return 'Mengonstruksi dan Mengurai Kubus dan Balok';
      case 1:
        return 'Visualisasi Spasial';
      case 2:
        return 'Pengertian Tabung dan Kerucut';
      default:
        return 'Materi';
    }
  }
}
