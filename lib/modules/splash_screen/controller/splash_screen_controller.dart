import 'package:get/get.dart';
import 'package:project_ta/core/routes/app_routes.dart';
import 'package:project_ta/modules/firsttimeuser/controller/firsttime_user_controller.dart';

class SplashScreenController extends GetxController {
  final FirstTimeUserController firstTimeUserController = Get.find<FirstTimeUserController>();

  Future<void> nextpage() async {
    await Future.delayed(const Duration(seconds: 2));

    checkFirstTimeUser();     
    
  }

  checkFirstTimeUser() {
   if (firstTimeUserController.isFirstTimeUser.value == false) {
      Get.offAllNamed(AppRoutes.firsttimeuser);
   }else{
     Get.offAllNamed(AppRoutes.home);
   }
  }

  @override
  void onInit() {
    super.onInit();
    nextpage();
  }
}
