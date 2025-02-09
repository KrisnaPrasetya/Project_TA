import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt _navIndex = 1.obs;
  int get navIndex => _navIndex.value;

  void setNavIndex(int index) {
    _navIndex.value = index;
    update();
  }
}
