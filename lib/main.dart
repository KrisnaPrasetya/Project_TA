import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/core/routes/app_pages.dart';
import 'package:project_ta/modules/hompage/screen/homepage_menu_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
        home: HomepageMenuScreen(),
        getPages: AppPages.pages,
      ),
    );
}
