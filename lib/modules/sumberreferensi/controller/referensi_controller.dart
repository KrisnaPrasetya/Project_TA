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
        judul: 'mengonstruksi dan mengurai bangun ruang matematika kelas 6',
        penulis: '',
        tahun: '2025',
        penerbit: 'My class My adventure',
        url: 'https://www.youtube.com/watch?v=11gXUUBGxKQ',
        deskripsi: '',
      ),

      // Video 2
      ReferensiModel(
        judul: 'visualisasi spasial matematika kelas 6 SD bangun ruang',
        penulis: '',
        tahun: '2025',
        penerbit: 'My class My adventure',
        url: 'https://www.youtube.com/watch?v=sJXxG7-eYsw',
        deskripsi: '',
      ),

      // Video 3
      ReferensiModel(
        judul: 'Lokasi KUBUS DAN BALOK Kelas 6 SD Kurikulum Merdeka',
        penulis: '',
        tahun: '2024',
        penerbit: 'Ruang Pintar',
        url: 'https://www.youtube.com/watch?v=cqb63ma5-c4',
        deskripsi: '',
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
