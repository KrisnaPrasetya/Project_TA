import 'package:get/get.dart';
import 'package:project_ta/core/routes/app_routes.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreenController extends GetxController {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> nextPage() async {
    await Future.delayed(const Duration(seconds: 3));
    try {
      await checkFirstTimeUser();
    } catch (e) {
      print('Error in secure storage: $e');
      await _secureStorage.deleteAll();
      Get.offAllNamed(AppRoutes.firsttimeuser);
    }
  }

  Future<void> checkFirstTimeUser() async {
    try {
      String? isFirstTime = await _secureStorage.read(key: 'isFirstTime');
      if (isFirstTime == null || isFirstTime != 'false') {
        Get.offAllNamed(AppRoutes.firsttimeuser);
      } else {
        Get.offAllNamed(AppRoutes.home);
      }
    } catch (e) {
      print('Error reading from secure storage: $e');
      // Re-throw untuk ditangani di nextPage()
      rethrow;
    }
  }

  @override
  void onInit() {
    super.onInit();
    nextPage();
  }
}