import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/detailmateri/controller/materi_controller.dart';

class CustomHeaderDetailMateri extends StatefulWidget {
  const CustomHeaderDetailMateri({super.key});

  @override
  State<CustomHeaderDetailMateri> createState() =>
      _CustomHeaderDetailMateriState();
}

class _CustomHeaderDetailMateriState extends State<CustomHeaderDetailMateri>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;
  final String materiTitle = "Kubus dan Balok";
  final String imageAsset = "assets/images/block_of_cubes.png";

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    final controller = Get.find<MateriPageController>();
    double initialProgress = controller.totalProgress.value / 100.0;

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: initialProgress,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    updateProgressAnimation();
  }

  void updateProgressAnimation() {
    final controller = Get.find<MateriPageController>();
    double newProgress = controller.totalProgress.value / 100.0;

    if (_progressAnimation.value != newProgress) {
      _progressAnimation = Tween<double>(
        begin: _progressAnimation.value,
        end: newProgress,
      ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ));

      _animationController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MateriPageController>(
      builder: (controller) {
        if (_progressAnimation.value !=
            controller.totalProgress.value / 100.0) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) updateProgressAnimation();
          });
        }

        return Container(
          width: double.infinity,
          height: Get.height * 0.30,
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
                top: Get.height * 0.05,
                left: Get.width * 0.04,
                right: Get.width * 0.04,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: Get.width * 0.90,
                      height: Get.height * 0.23,
                      padding: EdgeInsets.all(Get.width * 0.03),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              "assets/images/background_materi1.png"),
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
                            left: Get.width * 0.25,
                            top: Get.height * 0.010,
                            child: Text(
                              materiTitle,
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
                                SizedBox(
                                  height: Get.width * 0.23,
                                  width: Get.width * 0.23,
                                  child: AnimatedBuilder(
                                    animation: _progressAnimation,
                                    builder: (context, child) {
                                      return CircularProgressIndicator(
                                        value: _progressAnimation.value,
                                        strokeWidth: Get.width * 0.013,
                                        backgroundColor: Colors.grey[300],
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          (_progressAnimation.value >= 0.80)
                                              ? Colors.green
                                              : (_progressAnimation.value >=
                                                      0.50)
                                                  ? const Color(0xFF28A745)
                                                  : Colors.red[200]!,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                CircleAvatar(
                                  radius: Get.width * 0.10,
                                  backgroundColor: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        imageAsset,
                                        width: Get.width * 0.10,
                                        height: Get.width * 0.10,
                                      ),
                                      AnimatedBuilder(
                                        animation: _progressAnimation,
                                        builder: (context, child) {
                                          return Text(
                                            '${(_progressAnimation.value * 100).toInt()}%',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: Get.width * 0.04,
                                              color: (_progressAnimation.value *
                                                          100) >=
                                                      80
                                                  ? Colors.green
                                                  : (_progressAnimation.value *
                                                              100) >=
                                                          50
                                                      ? const Color(0xFF28A745)
                                                      : Colors.red[200]!,
                                            ),
                                          );
                                        },
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
              ),
            ],
          ),
        );
      },
    );
  }
}
