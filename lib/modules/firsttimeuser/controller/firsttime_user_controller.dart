import 'package:get/get.dart';

class FirstTimeUserController extends GetxController {
  RxBool isFirstTimeUser = false.obs;
  RxString avatar = "".obs;
  RxInt selectedIndex = (-1).obs;  

  void changeFirstTimeUser(bool value) {
    isFirstTimeUser.value = value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  void changeAvatar(int index) {
    selectedIndex.value = index;  
    switch (index) {
      case 0:
        avatar.value = "assets/images/avatar/avatar_0.png";
        break;
      case 1:
        avatar.value = "assets/images/avatar/avatar_1.png";
        break;
      case 2:
        avatar.value = "assets/images/avatar/avatar_2.png";
        break;
      case 3:
        avatar.value = "assets/images/avatar/avatar_3.png";
        break;
      case 4:
        avatar.value = "assets/images/avatar/avatar_4.png";
        break;
      default:
        avatar.value = "";
    }
  }
}
