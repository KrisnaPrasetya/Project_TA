import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/detailmateri/screen/detail_screen.dart';
import 'package:project_ta/modules/homescreen/controller/homescreen_controller.dart';
import 'package:project_ta/modules/hompage/screen/homepage_menu_screen.dart';
import 'package:project_ta/modules/materi/screen/materi_screen.dart';
import 'package:project_ta/modules/quiz/screen/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> homeWidgets = [
      QuizScreen(),
      HomepageMenuScreen(),
      DetailScreen()
    ];

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: Obx(() => homeWidgets[controller.navIndex]),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Obx(() =>
              _buildCenterFloatingButton(controller)),
          bottomNavigationBar:
              Obx(() => _buildBottomNavBar(controller)),
        );
      },
    );
  }

  Widget _buildCenterFloatingButton(HomeController controller) {
    return AnimatedContainer(
      duration:
          const Duration(milliseconds: 500),
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 8),
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: controller.navIndex == 2
              ? [Color(0xFF009CE1), Color(0xFF006AB5)]
              : controller.navIndex == 0
                  ? [Color(0xFFFFC100), Color(0xFFFFBE00)]
                  : [Color(0xFF1DE9B6), Color(0xFF64FFDA)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: FloatingActionButton(
        onPressed: () => controller.setNavIndex(1),
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Image.asset('assets/images/mascot.png', key: ValueKey(1))),
      ),
    );
  }

  Widget _buildBottomNavBar(HomeController controller) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 70,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: controller.navIndex == 2
              ? [Color(0xFF009CE1), Color(0xFF006AB5)]
              : controller.navIndex == 0
                  ? [Color(0xFFFFC100), Color(0xFFFFBE00)]
                  : [Color(0xFF1DE9B6), Color(0xFF64FFDA)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(controller, 0, 'assets/images/kuis.png', 'Kuis'),
          const SizedBox(width: 60),
          _buildNavItem(controller, 2, 'assets/images/mulai_belajar.png',
              'Mulai Belajar'),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      HomeController controller, int index, String iconPath, String label) {
    final isActive = controller.navIndex == index;
    return GestureDetector(
      onTap: () => controller.setNavIndex(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: 44,
            height: 44,
          ),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.black : Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
