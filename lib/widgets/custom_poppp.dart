import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/widgets/custom_button.dart';

class CustomDialog extends StatelessWidget {
  final String message;

  const CustomDialog({super.key, required, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              CustomButton(
                width: Get.width * 0.4,
                height: Get.height * 0.05,
                onPressed: () async {
                  Get.close(1);
                },
                color: Colors.green,
                child: Text(
                  "OK",
                  style: TextStyle(
                    fontSize: Get.width * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
