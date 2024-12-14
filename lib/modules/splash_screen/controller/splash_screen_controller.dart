import 'package:get/get.dart';
import 'package:project_ta/core/routes/app_routes.dart';

class SplashScreenController extends GetxController {
  Future<void> nextpage() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(AppRoutes.home);
  }

  @override
  void onInit() {
    super.onInit();
    nextpage();
  }
}
