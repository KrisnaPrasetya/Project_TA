import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class MateriPageController extends GetxController {
  final RxBool canStartAnimation = false.obs;
  final RxList<MaterialProgress> materials = <MaterialProgress>[].obs;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();
    // Initialize materials list
    materials.value = [
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

    // Load progress immediately when controller initializes
    _loadProgress();
    initAnimation();
  }

  Future<void> _loadProgress() async {
    try {
      for (var material in materials) {
        String key = 'progress_material_${material.id}';
        String? value = await _storage.read(key: key);
        if (value != null) {
          int index = materials.indexWhere((m) => m.id == material.id);
          if (index != -1) {
            materials[index] = MaterialProgress(
              id: material.id,
              title: material.title,
              progress: double.parse(value),
            );
          }
        }
      }
      // Trigger UI update
      materials.refresh();
      update();
    } catch (e) {
      print('Error loading progress: $e');
    }
  }

  Future<void> updateProgress(int materialId, double newProgress) async {
    try {
      int index = materials.indexWhere((m) => m.id == materialId);
      if (index != -1 && newProgress > materials[index].progress) {
        // Update in memory
        materials[index] = MaterialProgress(
          id: materialId,
          title: materials[index].title,
          progress: newProgress,
        );

        // Save to storage
        await _storage.write(
          key: 'progress_material_$materialId',
          value: newProgress.toString(),
        );

        // Trigger UI updates
        materials.refresh();
        update();
      }
    } catch (e) {
      print('Error updating progress: $e');
    }
  }

  Future<void> initAnimation() async {
    await Future.delayed(const Duration(milliseconds: 200));
    canStartAnimation.value = true;
  }

  Future<void> debugStoredValues() async {
    for (var material in materials) {
      String key = 'progress_material_${material.id}';
      String? value = await _storage.read(key: key);
      print(
          'Material ${material.id}: Stored value = $value, Current value = ${material.progress}');
    }
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

  MaterialProgress copyWith({
    int? id,
    String? title,
    double? progress,
  }) {
    return MaterialProgress(
      id: id ?? this.id,
      title: title ?? this.title,
      progress: progress ?? this.progress,
    );
  }
}
