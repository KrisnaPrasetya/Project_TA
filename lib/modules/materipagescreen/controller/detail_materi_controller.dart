import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/detailmateri/controller/materi_controller.dart';

class DetailMateriController extends GetxController {
  late ScrollController scrollController;
  late int materialId;
  double lastSavedProgress = 0;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  bool _isMaxScrollCalculated = false;

  @override
  void onInit() {
    super.onInit();
    final int args = Get.arguments ?? 0;
    materialId = Get.find<MateriPageController>().materials[args].id;
    scrollController = ScrollController();
    _initScroll();
    // _loadInitialProgress();
  }

  void _initScroll() {
    scrollController.addListener(_scrollListener);

    // Tunggu sampai layout selesai
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkMaxScroll();
    });
  }

  void _checkMaxScroll() {
    if (scrollController.hasClients &&
        scrollController.position.maxScrollExtent > 0) {
      _isMaxScrollCalculated = true;
    }
  }

  void _scrollListener() {
    if (!_isMaxScrollCalculated) return;

    final position = scrollController.position;
    double progress = (position.pixels / position.maxScrollExtent) * 100;

    // Hitung milestone progress
    double newProgress = _calculateMilestone(progress);

    // Update hanya jika progress meningkat
    if (newProgress > lastSavedProgress) {
      lastSavedProgress = newProgress;
      _saveProgress(newProgress);
    }
  }

  double _calculateMilestone(double progress) {
    if (progress >= 95) return 100; // Beri toleransi 5% untuk scroll akhir
    if (progress >= 70) return 75;
    if (progress >= 45) return 50;
    if (progress >= 20) return 25;
    return 0;
  }

  Future<void> _saveProgress(double progress) async {
    await _storage.write(
      key: 'progress_material_$materialId',
      value: progress.toString(),
    );

    // Update progress di MateriPageController
    Get.find<MateriPageController>().updateProgress(materialId, progress);
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }
}
