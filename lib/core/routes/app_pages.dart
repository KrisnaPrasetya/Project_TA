
import 'package:get/get.dart';
import 'package:project_ta/modules/homepage_menu/screen/homepage_menu_screen.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.login, page: () => const HomepageMenuScreen()),
   
  ];
}