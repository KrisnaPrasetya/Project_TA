import 'package:get/get.dart';

class MateriPageController extends GetxController {
  final RxBool canStartAnimation = false.obs;

  final List<MaterialProgress> materials = [
    MaterialProgress(
      id: 1,
      title: "Mengonstruksi dan Mengurai Kubus dan Balok",
      progress: 18,
    ),
    MaterialProgress(
      id: 2,
      title: "Visualisasi Spasial",
      progress: 21,
    ),
    MaterialProgress(
      id: 3,
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
