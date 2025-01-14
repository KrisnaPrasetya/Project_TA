import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final _secureStorage = const FlutterSecureStorage();
  RxString avatarPath = ''.obs;
  RxString userName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadAvatar();
    loadName();
  }

  Future<void> loadAvatar() async {
    String? savedAvatar = await _secureStorage.read(key: 'avatar');
    avatarPath.value = savedAvatar ?? ''; 
  }

  Future<void> loadName() async {
    String? savedName = await _secureStorage.read(key: 'name');
    userName.value = savedName ?? 'User';
  }
}
