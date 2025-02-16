import 'package:flutter/material.dart';
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
  bool _isFirstBuild = true;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _progressAnimation = Tween<double>(
      begin: 0,
      end: widget.material.progress,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _isFirstBuild = true;

    final mainController = Get.find<QuizController>();
    ever(mainController.canStartAnimation, (bool canStart) {
      if (canStart && mounted) {
        _startAnimation();
      }
    });
  }

  void _startAnimation() {
    if (_isFirstBuild) {
      _controller.forward();
      _isFirstBuild = false;
    } else {
      _controller.reset();
      _updateProgressAnimation();
      _controller.forward();
    }
  }

  void _updateProgressAnimation() {
    _progressAnimation = Tween<double>(
      begin: 0,
      end: widget.material.progress,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void didUpdateWidget(KuisItems oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.material.progress != widget.material.progress) {
      _updateProgressAnimation();
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
      return Colors.orange;
    } else {
      return Colors.red[200]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await Get.toNamed(
          AppRoutes.quizDetail,
          arguments: {'id': widget.material.id},
        );

        if (result == true) {
          _initializeAnimation();
        }
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
                          value: _progressAnimation.value / 100,
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
                AnimatedBuilder(
                  animation: _progressAnimation,
                  builder: (context, child) {
                    return Text(
                      '${_progressAnimation.value.toInt()} Poin',
                      style: TextStyle(
                        color: _getProgressColor(widget.material.progress),
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
  }
}
