// guide_controller.dart
import 'package:get/get.dart';

class GuideController extends GetxController {
  RxBool isVisible = true.obs;

  void hideGuide() {
    isVisible.value = false;
  }

  void showGuide() {
    isVisible.value = true;
  }
}
