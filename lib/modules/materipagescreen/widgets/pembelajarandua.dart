import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/core/routes/app_routes.dart';
import 'package:project_ta/widgets/custom_button.dart';

class Pembelajarandua extends StatelessWidget {
  const Pembelajarandua({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: CustomButton(
              onPressed: () => Get.offAllNamed(AppRoutes.cube),
              child: Text('click me'))),
    );
  }
}
  