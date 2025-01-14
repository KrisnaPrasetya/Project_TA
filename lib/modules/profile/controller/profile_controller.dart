
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
final _secureStorage = const FlutterSecureStorage();
  RxString avatarPath = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadAvatar();
  }

  Future<void> loadAvatar() async {
    String? savedAvatar = await _secureStorage.read(key: 'avatar');
    avatarPath.value = savedAvatar ?? ''; 
    }
}
