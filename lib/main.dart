import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/core/routes/app_pages.dart';
import 'package:project_ta/modules/homescreen/screen/homescreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
        home: HomeScreen(),
        getPages: AppPages.pages,
      ),
    );
}
