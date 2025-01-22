import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class MateriController extends GetxController {
  final _secureStorage = const FlutterSecureStorage();

  var userName = 'User'.obs;

  Future<void> loadName() async {
    String? name = await _secureStorage.read(key: 'name');
    userName.value = name ?? 'User';
  }

  @override
  void onInit() {
    loadName();
    super.onInit();
  }
}
