import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MenuItemlist extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const MenuItemlist({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        height: Get.height * 0.08,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: Get.width * 0.05),
            SvgPicture.asset(
              icon,
              height: Get.height * 0.03,
              width: Get.height * 0.03,
            ),
            SizedBox(width: Get.width * 0.05),
            Text(
              title,
              style: TextStyle(
                fontSize: Get.width * 0.04,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
