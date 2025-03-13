import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  final _secureStorage = const FlutterSecureStorage();
  final RxBool canStartAnimation = false.obs;
  final RxList<KuisProgress> materials = <KuisProgress>[].obs;
  
  // Add total points properties
  final RxInt totalPoints = 0.obs;
  final RxInt maxPoints = 300.obs; // Assuming max is 300 as seen in your header
  final RxDouble progressPercentage = 0.0.obs;

  bool isLearning = true;
  var userName = 'User'.obs;

  // Minimum material progress required to unlock a quiz
  final double requiredMaterialProgress = 100.0;
  // Minimum score to unlock next quiz
  final int minimumPassingScore = 80;

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
    
    // Calculate total points and percentage
    _calculateTotalPoints();
    
    // Delay to ensure widget rendering
    await Future.delayed(const Duration(milliseconds: 200));
    
    // Trigger animation
    canStartAnimation.value = true;
    update();
  }

  // Calculate total points
  void _calculateTotalPoints() {
    int total = 0;
    for (var material in materials) {
      total += material.progress.toInt();
    }
    
    totalPoints.value = total;
    progressPercentage.value = (total / maxPoints.value);
    update();
  }

  Future<void> refreshQuizPage() async {
    // Reset state
    canStartAnimation.value = false;
    materials.clear();
    totalPoints.value = 0;
    progressPercentage.value = 0.0;
    
    // Reinitialize
    await initializeQuizData();
  }

  Future<void> loadScores() async {
    final List<KuisProgress> updatedMaterials = [];
    
    for (int i = 1; i <= 3; i++) {
      final quizKey = 'quiz_${i}_points';
      final scoreStr = await _secureStorage.read(key: quizKey);
      final score = int.tryParse(scoreStr ?? '0') ?? 0;

      // Get material progress
      final materialKey = 'progress_material_$i';
      final progressStr = await _secureStorage.read(key: materialKey);
      final materialProgress = double.tryParse(progressStr ?? '0') ?? 0;

      // Get attempts remaining
      final attemptsKey = 'quiz_${i}_attempts';
      final attemptsStr = await _secureStorage.read(key: attemptsKey);
      final attemptsRemaining = int.tryParse(attemptsStr ?? '2') ?? 2;

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

      // Check if this quiz is unlocked - check ALL quizzes including the first one
      bool isUnlocked = await isQuizUnlocked(i);

      updatedMaterials.add(
        KuisProgress(
          id: i,
          title: title,
          progress: score.toDouble(),
          materialProgress: materialProgress,
          attemptsRemaining: attemptsRemaining,
          isUnlocked: isUnlocked,
        ),
      );
    }

    materials.assignAll(updatedMaterials);
    _calculateTotalPoints(); // Calculate totals after loading scores
    update();
  }

  // Check if a quiz is unlocked
  Future<bool> isQuizUnlocked(int quizId) async {
    // Get current material progress - this check applies to ALL quizzes
    final materialKey = 'progress_material_$quizId';
    final progressStr = await _secureStorage.read(key: materialKey);
    final materialProgress = double.tryParse(progressStr ?? '0') ?? 0;
    
    // First quiz only requires its material to be completed
    if (quizId == 1) {
      return materialProgress >= requiredMaterialProgress;
    }

    // For quizzes after the first one, also check previous quiz completion
    final previousScoreKey = 'quiz_${quizId - 1}_points';
    final previousScoreStr = await _secureStorage.read(key: previousScoreKey);
    final previousScore = int.tryParse(previousScoreStr ?? '0') ?? 0;

    // Get previous quiz attempts
    final previousAttemptsKey = 'quiz_${quizId - 1}_attempts';
    final previousAttemptsStr = await _secureStorage.read(key: previousAttemptsKey);
    final previousAttemptsRemaining = int.tryParse(previousAttemptsStr ?? '2') ?? 2;

    // Special case: if attempts are exhausted and score is still below minimum
    bool attemptsExhausted = previousAttemptsRemaining <= 0;

    // Quiz is unlocked if:
    // 1. Current material is studied 100% AND
    // 2. Previous quiz score is above minimum passing score OR attempts are exhausted
    return materialProgress >= requiredMaterialProgress && 
           (previousScore >= minimumPassingScore || attemptsExhausted);
  }

  @override 
  void onReady() {
    super.onReady();
    // Ensure animation starts when widget is ready
    initializeQuizData();
  }
}

class KuisProgress {
  final int id;
  final String title;
  final double progress;
  final double materialProgress;  // Added to track material study progress
  final int attemptsRemaining;    // Added to track attempts
  final bool isUnlocked;          // Added to track unlock status

  KuisProgress({
    required this.id,
    required this.title,
    required this.progress,
    this.materialProgress = 0.0,
    this.attemptsRemaining = 2,
    this.isUnlocked = false,
  });
}