import 'package:get/get.dart';
import 'package:project_ta/modules/detailquiz/model/quiz_model.dart';

class QuizdetailController extends GetxController {
  final RxInt currentQuestionIndex = 0.obs;
  final RxInt score = 0.obs;
  final RxDouble progress = 0.0.obs;
  final RxBool isAnswered = false.obs;
  late List<Question> questions;
  late int materialId;

  @override
  void onInit() {
    super.onInit();
    materialId = Get.arguments['id'];
    questions = QuizData.materialQuestions[materialId] ?? [];
    updateProgress();
  }

  void answerQuestion(int selectedAnswer) {
    if (!isAnswered.value) {
      isAnswered.value = true;
      if (selectedAnswer == questions[currentQuestionIndex.value].correctAnswer) {
        score.value++;
      }
      updateProgress();
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      isAnswered.value = false;
    }
  }

  void updateProgress() {
    progress.value = (score.value / questions.length) * 100;
  }

  void resetQuiz() {
    currentQuestionIndex.value = 0;
    score.value = 0;
    progress.value = 0;
    isAnswered.value = false;
  }
}