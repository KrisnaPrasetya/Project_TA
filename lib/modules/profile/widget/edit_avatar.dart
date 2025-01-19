import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/profile/controller/profile_controller.dart';
import 'package:project_ta/widgets/custom_button.dart';

class EditAvatarDialog extends StatelessWidget {
  final ProfileController controller;

  const EditAvatarDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(Get.width * 0.05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Pilih Avatar',
              style: TextStyle(
                fontSize: Get.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Obx(() {
              return Wrap(
                alignment: WrapAlignment.center,
                spacing: Get.width * 0.04,
                runSpacing: Get.width * 0.04,
                children: List.generate(
                  5,
                  (index) {
                    final avatarPath = 'assets/images/avatar/avatar_$index.png';
                    return GestureDetector(
                      onTap: () async {
                        await controller.updateAvatar(avatarPath);
                        Get.close(1);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: controller.avatarPath.value == avatarPath
                                ? Colors.green
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: Get.width * 0.11,
                          backgroundImage: AssetImage(avatarPath),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
            SizedBox(height: Get.height * 0.03),
            CustomButton(
              color: Colors.red,
              width: Get.width * 0.45,
              height: Get.height * 0.05,
              onPressed: () {
                Get.close(1);
              },
              child: Text(
                'Batal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
