
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/firsttimeuser/controller/firsttime_user_controller.dart';
import 'package:project_ta/modules/hompage/controller/homepage_menu_controller.dart';
import 'package:project_ta/modules/quiz/controller/quiz_controller.dart';

class BaseController {
  static initialize() async {
    Get.put(HomepageMenuController());
    Get.put(FirstTimeUserController());
    Get.put(QuizController());
     try {
    // Mencoba membaca semua data
    await const FlutterSecureStorage().readAll();
  } catch (e) {
    print('Error initializing secure storage: $e');
    // Jika terjadi error, hapus semua data
    try {
      await const FlutterSecureStorage().deleteAll();
      print('Deleted all secure storage data due to decryption error');
    } catch (deleteError) {
      print('Error deleting secure storage: $deleteError');
    }
  }
  }
  
}