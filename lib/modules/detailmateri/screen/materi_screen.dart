import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_ta/core/routes/app_routes.dart';
import 'package:project_ta/modules/detailmateri/controller/materi_controller.dart';
import 'package:project_ta/modules/detailmateri/widgets/header_materi.dart';

class MateriPageScreen extends StatelessWidget {
  const MateriPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return GetBuilder<MateriPageController>(
      init: MateriPageController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.grey[100],
          body: SingleChildScrollView(
            child: Column(
              children: [
                CustomHeaderDetailMateri(),
                SizedBox(height: Get.height * 0.025),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.012),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(Get.width * 0.025),
                    ),
                    child: Center(
                      child: Text(
                        'Pilihan Materi',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Get.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.015),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: controller.materials.length,
                    itemBuilder: (context, index) {
                      final material = controller.materials[index];
                      return AnimatedMaterialItem(material: material);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


class AnimatedMaterialItem extends StatefulWidget {
  final MaterialProgress material;

  const AnimatedMaterialItem({
    Key? key,
    required this.material,
  }) : super(key: key);

  @override
  State<AnimatedMaterialItem> createState() => _AnimatedMaterialItemState();
}

class _AnimatedMaterialItemState extends State<AnimatedMaterialItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;
  double _previousProgress = 0;

  @override
  void initState() {
    super.initState();
    _previousProgress = widget.material.progress;
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _progressAnimation = Tween<double>(
      begin: 0,
      end: widget.material.progress / 100,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Delay animation start to make it visible
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void didUpdateWidget(AnimatedMaterialItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.material.progress != widget.material.progress) {
      // Animate from previous value to new value
      _progressAnimation = Tween<double>(
        begin: _previousProgress / 100,
        end: widget.material.progress / 100,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ));
      
      _previousProgress = widget.material.progress;
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getProgressColor(double progress) {
    if (progress >= 80) {
      return Colors.green;
    } else if (progress >= 50) {
      return Colors.amber;
    } else {
      return Colors.amber[200]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final controller = Get.find<MateriPageController>();
      final currentMaterial = controller.materials.firstWhere(
        (m) => m.id == widget.material.id,
        orElse: () => widget.material,
      );

      return GestureDetector(
        onTap: () => Get.toNamed(
          AppRoutes.detailPageMateri,
          arguments: controller.materials.indexOf(currentMaterial),
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: Get.height * 0.02),
          padding: EdgeInsets.all(Get.width * 0.04),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Get.width * 0.04),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: Get.width * 0.002,
                blurRadius: Get.width * 0.01,
                offset: Offset(0, Get.height * 0.002),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${currentMaterial.id}: ${currentMaterial.title}',
                style: TextStyle(
                  fontSize: Get.width * 0.035,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Get.width * 0.025),
                      child: AnimatedBuilder(
                        animation: _progressAnimation,
                        builder: (context, child) {
                          return LinearProgressIndicator(
                            value: _progressAnimation.value,
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              _getProgressColor(currentMaterial.progress),
                            ),
                            minHeight: Get.height * 0.008,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: Get.width * 0.02),
                  AnimatedBuilder(
                    animation: _progressAnimation,
                    builder: (context, child) {
                      return Text(
                        '${(_progressAnimation.value * 100).toInt()}%',
                        style: TextStyle(
                          color: _getProgressColor(currentMaterial.progress),
                          fontWeight: FontWeight.bold,
                          fontSize: Get.width * 0.03,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}