import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/homescreen/controller/homescreen_controller.dart';
import 'package:project_ta/modules/hompage/screen/homepage_menu_screen.dart';
import 'package:project_ta/modules/materi/screen/materi_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> homeWidgets = [
      Center(child: Text('Kuis', style: TextStyle(fontSize: 24))),
      HomepageMenuScreen(),
      MateriMenuScreen()
    ];

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: Obx(() => homeWidgets[controller.navIndex]),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: _buildCenterFloatingButton(controller),
          bottomNavigationBar: _buildBottomNavBar(controller),
        );
      },
    );
  }

  Widget _buildCenterFloatingButton(HomeController controller) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(255, 255, 255, 255), width: 8),
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Color(0xFF1DE9B6), Color(0xFF64FFDA)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: FloatingActionButton(
        onPressed: () => controller.setNavIndex(1),
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Image.asset('assets/images/mascot.png'),
      ),
    );
  }

  Widget _buildBottomNavBar(HomeController controller) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1DE9B6), Color(0xFF64FFDA)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(controller, 0, 'assets/images/kuis.png', 'Kuis'),
              const SizedBox(width: 60),
              _buildNavItem(controller, 2, 'assets/images/mulai_belajar.png',
                  'Mulai Belajar'),
            ],
          )),
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
