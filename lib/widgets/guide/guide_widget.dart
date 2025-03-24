
// guide_widget.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project_ta/widgets/guide/guide_widget_controller.dart';

class GuideWidget extends StatelessWidget {
  final String lottieAsset;
  final String message;
  
  GuideWidget({
    Key? key, 
    required this.lottieAsset,
    this.message = 'Tap anywhere to close',
  }) : super(key: key);

  // Inisialisasi controller GetX
  final GuideController controller = Get.put(GuideController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isVisible.value 
      ? GestureDetector(
          onTap: () => controller.hideGuide(),
          child: Container(
            color: Colors.black.withOpacity(0.7),
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Widget Lottie di tengah
                  Lottie.asset(
                    lottieAsset,
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  // Pesan petunjuk
                  const SizedBox(height: 16),
                  Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      : const SizedBox.shrink() // Widget kosong jika tidak terlihat
    );
  }
}