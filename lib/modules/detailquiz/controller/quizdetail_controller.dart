import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/detailquiz/model/quiz_model.dart';
import 'package:project_ta/modules/quiz/controller/quiz_controller.dart';

class QuizdetailController extends GetxController {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final RxInt currentQuestionIndex = 0.obs;
  final RxInt score = 0.obs;
  final RxBool isAnswered = false.obs;
  final RxInt selectedAnswerIndex = (-1).obs;
  late List<Question> questions;
  late int materialId;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    materialId = Get.arguments['id'];
    questions = QuizData.materialQuestions[materialId] ?? [];
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void answerQuestion(int selectedAnswer) {
    if (!isAnswered.value) {
      selectedAnswerIndex.value = selectedAnswer;
      isAnswered.value = true;
      if (selectedAnswer ==
          questions[currentQuestionIndex.value].correctAnswer) {
        score.value += 20; // Tambah 20 poin per jawaban benar
      }
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      isAnswered.value = false;
      selectedAnswerIndex.value = -1;

      scrollController.animateTo(
        0,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  Future<void> saveScore() async {
    // Hanya simpan jika semua soal dijawab
    if (currentQuestionIndex.value == questions.length - 1) {
      final key = 'quiz_${materialId}_points';
      final storedScore = await _secureStorage.read(key: key);
      final currentScore = score.value;

      // Ambil nilai tertinggi
      final highestScore = max(
        currentScore,
        int.tryParse(storedScore ?? '0') ?? 0,
      );

      await _secureStorage.write(key: key, value: highestScore.toString());

      // Paksa update data di QuizPageScreen
      Get.find<QuizController>().loadScores();
    }
  }

  void resetQuiz() {
    currentQuestionIndex.value = 0;
    score.value = 0;
    isAnswered.value = false;
    selectedAnswerIndex.value = -1;
  }
}
