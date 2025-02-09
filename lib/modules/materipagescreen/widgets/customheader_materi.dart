import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomheaderMateri extends StatelessWidget {
  final int args;

  const CustomheaderMateri({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height * 0.16,
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          Flexible(
            child: Text(
              _getTitle(args),
              style: TextStyle(
                fontSize: Get.width * 0.045, // Responsive font size
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 2, // ✅ Allows wrapping to second line
              softWrap: true, // ✅ Ensures wrapping
              textAlign: TextAlign.start, // ✅ Aligns text properly
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
