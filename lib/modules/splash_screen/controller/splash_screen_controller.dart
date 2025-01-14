import 'package:get/get.dart';
import 'package:project_ta/core/routes/app_routes.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreenController extends GetxController {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> nextPage() async {
    await Future.delayed(const Duration(seconds: 2));
    await checkFirstTimeUser();
  }

  Future<void> checkFirstTimeUser() async {
    String? isFirstTime = await _secureStorage.read(key: 'isFirstTime');
    if (isFirstTime == null || isFirstTime != 'false') {
      // User's first time, navigate to avatar setup
      Get.offAllNamed(AppRoutes.firsttimeuser);
    } else {
      // User has already set up avatar, navigate to home
      Get.offAllNamed(AppRoutes.home);
    } 
  }

  @override
  void onInit() {
    super.onInit();
    nextPage();
  }
}
