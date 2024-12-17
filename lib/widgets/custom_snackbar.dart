import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomSnackbar {
  static void showSnackbar({
    required String title,
    required String message,
    required String lottieAsset,
    SnackPosition snackPosition = SnackPosition.TOP,
    Color backgroundColor = Colors.red,
    Color textColor = Colors.white,
  }) {
    Get.snackbar(
      '',
      '',
      snackPosition: snackPosition,
      backgroundColor: backgroundColor,
      colorText: textColor,
      duration: Duration(seconds: 3),
      borderRadius: 10,
      messageText: Align(
        alignment: Alignment.center,
        child: Row(
          children: [
            Lottie.asset(
              lottieAsset,
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 14,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
