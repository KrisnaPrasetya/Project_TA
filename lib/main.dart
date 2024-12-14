import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_ta/core/base/base_controller.dart';
import 'package:project_ta/core/routes/app_pages.dart';
import 'package:project_ta/core/routes/app_routes.dart';
import 'package:project_ta/modules/homescreen/screen/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BaseController.initialize();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      initialRoute: AppRoutes.splashScreen,
      getPages: AppPages.pages,
      transitionDuration: const Duration(milliseconds: 300),
      title: 'Aplikasi Pembelajaran Matematika',
      // Handle unknown routes
      unknownRoute: GetPage(
        name: '/home',
        page: () => const HomeScreen(),
      ),
    ),
  );

  //Make Status Bar Transparent % Lock Screen to potrait
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
