import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  final _secureStorage = const FlutterSecureStorage();
  final RxBool canStartAnimation = false.obs;

  bool isLearning = true;
  var userName = 'User'.obs;

  @override
  void onInit() {
    loadName();
    initAnimation();
    super.onInit();
  }

  Future<void> loadName() async {
    String? name = await _secureStorage.read(key: 'name');
    userName.value = name ?? 'User';
  }

  @override
  void onClose() {
    super.onClose();
  }

  final List<KuisProgress> materials = [
    KuisProgress(
      id: 1,
      title: "Mengonstruksi dan Mengurai Kubus dan Balok",
      progress: 18,
    ),
    KuisProgress(
      id: 2,
      title: "Visualisasi Spasial",
      progress: 21,
    ),
    KuisProgress(
      id: 3,
      title: "Lokasi dan Koordinat",
      progress: 4,
    ),
  ];

  Future<void> initAnimation() async {
    await Future.delayed(const Duration(milliseconds: 100));
    canStartAnimation.value = true;
  }
}

class KuisProgress {
  final int id;
  final String title;
  final double progress;

  KuisProgress({
    required this.id,
    required this.title,
    required this.progress,
  });
}
