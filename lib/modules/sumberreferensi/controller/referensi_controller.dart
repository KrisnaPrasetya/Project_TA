// referensi_controller.dart
import 'package:get/get.dart';
import 'package:project_ta/modules/sumberreferensi/models/referensi_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ReferensiController extends GetxController {
  final isLoading = true.obs;
  List<ReferensiModel> referensiList = [];

  @override
  void onInit() {
    super.onInit();
    loadReferensi();
  }

  void loadReferensi() async {
    // Simulasi loading data (bisa diganti dengan API call atau database call)
    await Future.delayed(const Duration(milliseconds: 500));

    // Populate data referensi - 1 buku dan 3 video
    referensiList = [
      // Buku
      ReferensiModel(
        judul: 'Matematika untuk SD/MI Kelas VI',
        penulis:
            'Dicky Susanto, Savitri Sihombing, Ambarsari Kusuma Wardani, Ummy Salmah, Eunice Salim',
        tahun: '2022',
        penerbit: 'Kementerian Pendidikan, Kebudayaan, Riset, dan Teknologi',
        url:
            'https://buku.kemdikbud.go.id/katalog/matematika-untuk-sdmi-kelas-vi',
        deskripsi:
            'Buku ini merupakan buku matematika untuk siswa kelas VI SD/MI yang diterbitkan oleh Kementerian Pendidikan, Kebudayaan, Riset, dan Teknologi.',
      ),

      // Video 1
      ReferensiModel(
        judul: 'Flutter & GetX State Management Tutorial [Video]',
        penulis: '', 
        tahun: '2022',
        penerbit: 'The Flutter Way',
        url: 'https://www.youtube.com/watch?v=g4jmm8WXuZE',
        deskripsi:
            'Tutorial video yang membahas implementasi GetX state management dalam aplikasi Flutter.',
      ),

      // Video 2
      ReferensiModel(
        judul: 'Flutter GetX Pattern: Complete Responsive UI [Video]',
        penulis: '',
        tahun: '2022',
        penerbit: 'Afgprogrammer', 
        url: 'https://www.youtube.com/watch?v=IrVQQpAQMKM',
        deskripsi:
            'Tutorial implementasi desain responsif menggunakan Flutter dan GetX pattern.',
      ),

      // Video 3
      ReferensiModel(
        judul:
            'Flutter GetX Crash Course: State Management & Navigation [Video]',
        penulis: '',
        tahun: '2023',
        penerbit: 'Tadas Petra',
        url: 'https://www.youtube.com/watch?v=ttQtlX_Q0eU',
        deskripsi:
            'Crash course video yang menjelaskan penggunaan GetX untuk state management dan navigasi dalam Flutter.',
      ),
    ];

    isLoading.value = false;
    update();
  }

  void launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        Get.snackbar(
          'Error',
          'Tidak dapat membuka URL: $url',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
