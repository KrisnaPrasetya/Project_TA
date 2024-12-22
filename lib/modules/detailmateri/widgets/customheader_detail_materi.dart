import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/detailmateri/controller/detail_materi_controller.dart';

class CustomHeaderDetailMateri extends StatelessWidget {
  const CustomHeaderDetailMateri({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetailMateriController>();
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.30,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF009CE1), Color(0xFF006AB5)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 45,
            left: 16,
            right: 16,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: Get.width * 0.92,
                  height: Get.height * 0.23,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/background_materi1.png"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 110,
                        top: 12,
                        child: Text(
                          'Kubus dan Balok',
                          style: TextStyle(
                            fontSize: Get.width * 0.045,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            HeaderProgressIndicator(),
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/block_of_cubes.png",
                                    width: 40,
                                    height: 40,
                                  ),
                                  Obx(() => AnimatedFlipCounter(
                                    duration: const Duration(milliseconds: 1500),
                                    value: controller.canStartAnimation.value ? 100 : 0,
                                    suffix: "%",
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Get.width * 0.03,
                                      color: Colors.green,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderProgressIndicator extends StatefulWidget {
  @override
  State<HeaderProgressIndicator> createState() => _HeaderProgressIndicatorState();
}

class _HeaderProgressIndicatorState extends State<HeaderProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animation = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    final controller = Get.find<DetailMateriController>();
    ever(controller.canStartAnimation, (bool canStart) {
      if (canStart) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SizedBox(
          height: 90,
          width: 90,
          child: CircularProgressIndicator(
            value: _animation.value,
            strokeWidth: 5,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(
              Colors.green,
            ),
          ),
        );
      },
    );
  }
}