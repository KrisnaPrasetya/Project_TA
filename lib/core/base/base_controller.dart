
import 'package:get/get.dart';
import 'package:project_ta/modules/firsttimeuser/controller/firsttime_user_controller.dart';
import 'package:project_ta/modules/hompage/controller/homepage_menu_controller.dart';
import 'package:project_ta/modules/quiz/controller/quiz_controller.dart';

class BaseController {
  static initialize() {
    Get.put(HomepageMenuController());
    Get.put(FirstTimeUserController());
    Get.put(QuizController());
  }
}