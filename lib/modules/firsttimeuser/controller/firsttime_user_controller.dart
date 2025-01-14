import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project_ta/core/routes/app_routes.dart';
import 'package:project_ta/widgets/custom_poppp.dart';

class FirstTimeUserController extends GetxController {
  RxBool isFirstTimeUser = true.obs;
  RxString avatar = "".obs;
  TextEditingController nameController = TextEditingController();
  RxInt selectedIndex = (-1).obs;

  final _storage = const FlutterSecureStorage();

  Future<bool> isFirstTimeOpeningApp() async {
    String? isFirstTime = await _storage.read(key: 'isFirstTime');
    return isFirstTime == null || isFirstTime != 'false';
  }

  @override
  void onInit() {
    super.onInit();
    _loadUserData();
  }

  // Change and store avatar selection
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

  // Save user data (avatar and name) to secure storage
  Future<void> saveUserData() async {
    await _storage.write(key: 'isFirstTime', value: 'false');
    await _storage.write(key: 'avatar', value: avatar.value);
    await _storage.write(key: 'name', value: nameController.text.trim());
  }

  // Validate inputs
  Future<void> validateAndSave() async {
    if (avatar.isEmpty) {
      _showPopup('Kamu belum avatar terlebih dahulu.');
      return;
    }

    if (nameController.text.trim().isEmpty) {
      _showPopup('Masukkan nama kamu terlebih dahulu yah.');
      return;
    }

    // If valid, save data and navigate
    await saveUserData();
    Get.offAllNamed(AppRoutes.home);
  }

  // Show popup
  void _showPopup(String message) {
    Get.dialog(
      CustomDialog(message: message),
      barrierDismissible: false,
    );
  }

  // Load user data on app startup
  Future<void> _loadUserData() async {
    String? isFirstTime = await _storage.read(key: 'isFirstTime');
    String? savedAvatar = await _storage.read(key: 'avatar');

    if (isFirstTime == 'false' && savedAvatar != null) {
      isFirstTimeUser.value = false;
      avatar.value = savedAvatar;
    }
  }
}
