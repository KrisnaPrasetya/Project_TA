import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Interactive3DGuideController extends GetxController {
  // Map untuk menyimpan status guide untuk setiap objek 3D
  final Map<String, bool> _guideShownMap = {};

  // Cek apakah guide sudah ditampilkan
  bool isGuideShown(String objectId) {
    return _guideShownMap[objectId] ?? false;
  }

  // Tandai bahwa guide sudah ditampilkan
  void markGuideAsShown(String objectId) {
    _guideShownMap[objectId] = true;
    update();
  }
}