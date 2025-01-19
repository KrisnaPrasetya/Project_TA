import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class HomepageMenuController extends GetxController {
  final _secureStorage = const FlutterSecureStorage();

  Future<String> loadAvatar() async {
    String? avatarPath = await _secureStorage.read(key: 'avatar');
    return avatarPath ?? '';
  }

  Future<String> loadName() async {
    String? name = await _secureStorage.read(key: 'name');
    return name ?? 'User';
  }

  @override
  void onInit() {
    loadAvatar();
    loadName();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
