import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_ta/core/routes/app_routes.dart';
import 'package:project_ta/modules/quiz/controller/quiz_controller.dart';

class KuisItems extends StatefulWidget {
  final KuisProgress material;

  const KuisItems({
    Key? key,
    required this.material,
  }) : super(key: key);

  @override
  State<KuisItems> createState() => _KuisItemsState();
}

class _KuisItemsState extends State<KuisItems>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
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

    final mainController = Get.find<QuizController>();
    ever(mainController.canStartAnimation, (bool canStart) {
      if (canStart) _controller.forward();
    });
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
    final controller = Get.find<QuizController>();

    return GestureDetector(
      onTap: () {
        print('Material ID: ${widget.material.id}');
        Get.toNamed(
          AppRoutes.quizDetail,
          arguments: {'id': widget.material.id},
        );
      },
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
              '${widget.material.id}: ${widget.material.title}',
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
                            _getProgressColor(widget.material.progress),
                          ),
                          minHeight: Get.height * 0.008,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: Get.width * 0.02),
                Obx(() => AnimatedFlipCounter(
                      duration: const Duration(milliseconds: 1500),
                      value: controller.canStartAnimation.value
                          ? widget.material.progress.toInt()
                          : 0,
                      suffix: "%",
                      textStyle: TextStyle(
                        color: _getProgressColor(widget.material.progress),
                        fontWeight: FontWeight.bold,
                        fontSize: Get.width * 0.03,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
