import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  final _secureStorage = const FlutterSecureStorage();
  final RxBool canStartAnimation = false.obs;
  final RxList<KuisProgress> materials = <KuisProgress>[].obs;

  bool isLearning = true;
  var userName = 'User'.obs;

  Future<void> loadName() async {
    String? name = await _secureStorage.read(key: 'name');
    userName.value = name ?? 'User';
  }

  @override
  void onClose() {
    super.onClose();
  }

@override
  void onInit() {
    super.onInit();
    loadName();
    initializeQuizData();
  }

  Future<void> initializeQuizData() async {
    // Reset animation state
    canStartAnimation.value = false;
    
    // Load scores
    await loadScores();
    
    // Delay sedikit lebih lama untuk memastikan widget sudah ter-render
    await Future.delayed(const Duration(milliseconds: 200));
    
    // Trigger animation
    canStartAnimation.value = true;
    update();
  }

  Future<void> refreshQuizPage() async {
    // Reset state
    canStartAnimation.value = false;
    materials.clear();
    
    // Reinitialize
    await initializeQuizData();
  }

  Future<void> loadScores() async {
    final List<KuisProgress> updatedMaterials = [];
    
    for (int i = 1; i <= 3; i++) {
      final key = 'quiz_${i}_points';
      final scoreStr = await _secureStorage.read(key: key);
      final score = int.tryParse(scoreStr ?? '0') ?? 0;

      String title;
      switch (i) {
        case 1:
          title = "Mengonstruksi dan Mengurai Kubus dan Balok";
          break;
        case 2:
          title = "Visualisasi Spasial";
          break;
        case 3:
          title = "Lokasi dan Koordinat";
          break;
        default:
          title = "Unknown Material";
      }

      updatedMaterials.add(
        KuisProgress(
          id: i,
          title: title,
          progress: score.toDouble(),
        ),
      );
    }

    materials.assignAll(updatedMaterials);
    update();
  }

  @override 
  void onReady() {
    super.onReady();
    // Memastikan animasi dimulai ketika widget sudah siap
    initializeQuizData();
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
