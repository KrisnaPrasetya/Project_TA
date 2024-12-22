import 'package:get/get.dart';

class DetailMateriController extends GetxController {
  final RxBool canStartAnimation = false.obs;

  final List<MaterialProgress> materials = [
    MaterialProgress(
      id: 1,
      title: "Pengertian Kubus dan Balok",
      progress: 100,
    ),
    MaterialProgress(
      id: 2,
      title: "Mengonstruksi dan Mengurai Kubus dan Balok",
      progress: 88,
    ),
    MaterialProgress(
      id: 3,
      title: "Sifat-Sifat Kubus dan Balok",
      progress: 63,
    ),
    MaterialProgress(
      id: 4,
      title: "Visualisasi Spasial",
      progress: 21,
    ),
    MaterialProgress(
      id: 5,
      title: "Volume dan Luas Permukaan",
      progress: 4,
    ),
    MaterialProgress(
      id: 6,
      title: "Lokasi dan Koordinat",
      progress: 4,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    initAnimation();
  }

  Future<void> initAnimation() async {
    await Future.delayed(const Duration(milliseconds: 100));
    canStartAnimation.value = true;
  }
}

class MaterialProgress {
  final int id;
  final String title;
  final double progress;

  MaterialProgress({
    required this.id,
    required this.title,
    required this.progress,
  });
}
