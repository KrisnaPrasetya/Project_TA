import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/profile/controller/profile_controller.dart';
import 'package:project_ta/widgets/custom_button.dart';

class EditNameDialog extends StatelessWidget {
  final ProfileController controller;

  const EditNameDialog({super.key, required this.controller});

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
              'Ganti Nama Kamu',
              style: TextStyle(
                fontSize: Get.width * 0.05,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: controller.nameController,
                    maxLength: 30,
                    decoration: InputDecoration(
                      hintText: 'Masukkan nama baru',
                      counterText: "",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.04,
                        vertical: Get.height * 0.02,
                      ),
                    ),
                    onChanged: (_) {
                      if (controller.errorMessage.value.isNotEmpty) {
                        controller.errorMessage.value = '';
                      }
                    },
                  ),
                ),
                SizedBox(height: Get.height * 0.005),
                Obx(() {
                  return controller.errorMessage.value.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.01),
                          child: Text(
                            controller.errorMessage.value,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: Get.width * 0.035,
                            ),
                          ),
                        )
                      : SizedBox.shrink();
                }),
              ],
            ),
            SizedBox(height: Get.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  color: Colors.red,
                  width: Get.width * 0.25,
                  height: Get.height * 0.05,
                  onPressed: () {
                    Get.close(1);
                    controller.errorMessage.value = '';
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
                CustomButton(
                  width: Get.width * 0.35,
                  height: Get.height * 0.05,
                  color: Colors.green,
                  onPressed: () async {
                    String inputName = controller.nameController.text.trim();

                    if (inputName.isEmpty) {
                      controller.errorMessage.value = 'Nama tidak boleh kosong';
                      return;
                    }

                    await controller.updateName(inputName);
                    Get.close(1);
                  },
                  child: Text(
                    'Simpan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
