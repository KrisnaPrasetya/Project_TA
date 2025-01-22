
import 'package:get/get.dart';
import 'package:project_ta/modules/detailmateri/screen/detail_screen.dart';
import 'package:project_ta/modules/firsttimeuser/screen/firsttime_user_screen.dart';
import 'package:project_ta/modules/homescreen/screen/homescreen.dart';
import 'package:project_ta/modules/hompage/screen/homepage_menu_screen.dart';
import 'package:project_ta/modules/materipagescreen/screen/materi_page_screen.dart';
import 'package:project_ta/modules/profile/screen/profile_screen.dart';
import 'package:project_ta/modules/splash_screen/screen/splash_screen.dart';
import 'package:project_ta/reference/cube.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.homeMenu, page: () => const HomepageMenuScreen()),
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(name: AppRoutes.splashScreen, page: () =>  SplashScreen()),
    GetPage(name: AppRoutes.detailMateri, page: () =>  DetailScreen()),
    GetPage(name: AppRoutes.detailPageMateri, page: () =>  MateriPageScreen(),),
    GetPage(name: AppRoutes.firsttimeuser, page: () =>  FirsttimeUserScreen()),
    GetPage(name: AppRoutes.profile, page: () =>  ProfileScreen()),
    GetPage(name: AppRoutes.cube, page: () =>  CubePage()),
  ];
}