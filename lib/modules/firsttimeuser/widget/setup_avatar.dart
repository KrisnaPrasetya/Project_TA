import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_ta/modules/firsttimeuser/controller/firsttime_user_controller.dart';
import 'package:project_ta/widgets/custom_button.dart';

class SetupAvatarWidget extends StatelessWidget {
  final FirstTimeUserController controller;
  const SetupAvatarWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.02),
              Obx(() => Container(
                    width: Get.width * 0.25,
                    height: Get.width * 0.25,
                    decoration: BoxDecoration(
                      color: HexColor("#9DF4E6"),
                      borderRadius: BorderRadius.circular(Get.width * 0.125),
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                    child: controller.avatar.value.isEmpty
                        ? Icon(
                            Icons.person,
                            size: Get.width * 0.125,
                            color: Colors.white,
                          )
                        : CircleAvatar(
                            radius: Get.width * 0.11,
                            backgroundImage:
                                AssetImage(controller.avatar.value),
                          ),
                  )),
              SizedBox(height: Get.height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: controller.nameController,
                        maxLength: 30, // Membatasi maksimal 30 karakter
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: Get.width * 0.04,
                        ),
                        decoration: InputDecoration(
                          hintText: "Ketik nama kamu disini",
                          hintStyle: TextStyle(
                            color: Colors.black54,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: Get.height * 0.02,
                            horizontal: Get.width * 0.04,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          counterText: "", // Hilangkan counter default
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.06),
              Text(
                "Pilih avatar kamu",
                style: TextStyle(
                  fontSize: Get.width * 0.048,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Obx(
                  () => Wrap(
                    alignment: WrapAlignment.center,
                    spacing: Get.width * 0.04,
                    runSpacing: Get.width * 0.04,
                    children: List.generate(
                      5,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            controller.changeAvatar(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: controller.selectedIndex.value == index
                                    ? Colors.white
                                    : Colors.transparent,
                                width: 3,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: Get.width * 0.11,
                              backgroundImage: AssetImage(
                                  'assets/images/avatar/avatar_$index.png'),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.05),
              SizedBox(height: Get.height * 0.1),
              CustomButton(
                width: Get.width * 0.8,
                height: Get.height * 0.06,
                onPressed: () async {
                  await controller.validateAndSave();
                },
                color: Colors.green,
                child: Text(
                  "Lanjut",
                  style: TextStyle(
                    fontSize: Get.width * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
