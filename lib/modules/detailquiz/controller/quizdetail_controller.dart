import 'package:get/get.dart';
import 'package:project_ta/modules/detailquiz/model/quiz_model.dart';
class QuizdetailController extends GetxController {
  final RxInt currentQuestionIndex = 0.obs;
  final RxInt score = 0.obs;
  final RxBool isAnswered = false.obs;
  final RxInt selectedAnswerIndex = (-1).obs;  // Add this line
  late List<Question> questions;
  late int materialId;

  @override
  void onInit() {
    super.onInit();
    materialId = Get.arguments['id'];
    questions = QuizData.materialQuestions[materialId] ?? [];
  }

  void answerQuestion(int selectedAnswer) {
    if (!isAnswered.value) {
      selectedAnswerIndex.value = selectedAnswer;  // Add this line
      isAnswered.value = true;
      if (selectedAnswer == questions[currentQuestionIndex.value].correctAnswer) {
        score.value++;
      }
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      isAnswered.value = false;
      selectedAnswerIndex.value = -1;
    }
  }

  void resetQuiz() {
    currentQuestionIndex.value = 0;
    score.value = 0;
    isAnswered.value = false;
    selectedAnswerIndex.value = -1; 
  }
}