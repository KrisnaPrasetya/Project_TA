import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class MateriPageController extends GetxController {
  final RxBool canStartAnimation = false.obs;
  List<MaterialProgress> materials = [];
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();
    materials = [
      MaterialProgress(
        id: 1,
        title: "Mengonstruksi dan Mengurai Kubus dan Balok",
        progress: 0,
      ),
      MaterialProgress(
        id: 2,
        title: "Visualisasi Spasial",
        progress: 0,
      ),
      MaterialProgress(
        id: 3,
        title: "Lokasi dan Koordinat",
        progress: 0,
      ),
    ];
    _loadProgress();
    initAnimation();
  }

  Future<void> _loadProgress() async {
    for (var material in materials) {
      String key = 'progress_material_${material.id}';
      String? value = await _storage.read(key: key);
      if (value != null) {
        material.progress = double.parse(value);
      }
    }
    update();
  }

  Future<void> updateProgress(int materialId, double newProgress) async {
    MaterialProgress material = materials.firstWhere((m) => m.id == materialId);
    if (newProgress > material.progress) {
      material.progress = newProgress;
      await _storage.write(
        key: 'progress_material_$materialId',
        value: newProgress.toString(),
      );
      update();
    }
  }

  Future<void> initAnimation() async {
    await Future.delayed(const Duration(milliseconds: 100));
    canStartAnimation.value = true;
  }
}

class MaterialProgress {
  final int id;
  final String title;
  double progress;

  MaterialProgress({
    required this.id,
    required this.title,
    required this.progress,
  });
}