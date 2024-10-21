
import 'package:get/get.dart';
import 'package:project_ta/modules/homepage_menu/controller/homepage_menu_controller.dart';

class BaseController {
  static initialize() {
    Get.put(HomepageMenuController());

  }
}