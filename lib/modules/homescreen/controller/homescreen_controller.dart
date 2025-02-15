import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/quiz/controller/quiz_controller.dart';

class HomeController extends GetxController {
  final RxInt _navIndex = 1.obs;
  int get navIndex => _navIndex.value;

  void setNavIndex(int index) async {
    // Jika berpindah ke halaman quiz (index 0)
    if (index == 0) {
      // Pastikan QuizController sudah terinisialisasi
      if (Get.isRegistered<QuizController>()) {
        final quizController = Get.find<QuizController>();
        // Reset dan reinisialisasi quiz page
        await quizController.refreshQuizPage();
      }
    }
    
    _navIndex.value = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    // Listen to navigation changes
    ever(_navIndex, (index) {
      if (index == 0) {
        // Memastikan QuizController di-refresh setiap kali halaman quiz ditampilkan
        if (Get.isRegistered<QuizController>()) {
          Get.find<QuizController>().refreshQuizPage();
        }
      }
    });
  }
}