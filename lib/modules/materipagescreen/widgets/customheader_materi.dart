import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomheaderMateri extends StatelessWidget {
  final int args;

  const CustomheaderMateri({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.02, vertical: Get.height * 0.01),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 97, 174, 236),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
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
