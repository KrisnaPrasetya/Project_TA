import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/detailmateri/controller/detail_materi_controller.dart';

class DetailMateriController extends GetxController {
  late ScrollController scrollController;
  late int materialId;
  double lastSavedProgress = 0;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();
    final int args = Get.arguments ?? 0;
    materialId = Get.find<MateriPageController>().materials[args].id;
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    _loadInitialProgress();
  }

  Future<void> _loadInitialProgress() async {
    String? value = await _storage.read(key: 'progress_material_$materialId');
    lastSavedProgress = double.parse(value ?? '0');
  }

  void _scrollListener() {
    final position = scrollController.position;
    if (position.maxScrollExtent == 0) return;

    double progress = (position.pixels / position.maxScrollExtent) * 100;
    double newProgress = _calculateMilestone(progress);

    if (newProgress > lastSavedProgress) {
      lastSavedProgress = newProgress;
      Get.find<MateriPageController>().updateProgress(materialId, newProgress);
    }
  }

  double _calculateMilestone(double progress) {
    if (progress >= 100) return 100;
    if (progress >= 75) return 75;
    if (progress >= 50) return 50;
    if (progress >= 25) return 25;
    return 0;
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}