import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/core/routes/app_routes.dart';
import 'package:project_ta/modules/profile/controller/profile_controller.dart';
import 'package:project_ta/modules/profile/widget/edit_avatar.dart';
import 'package:project_ta/modules/profile/widget/edit_name.dart';
import 'package:project_ta/modules/profile/widget/menu_itemlist.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            Get.offAllNamed(AppRoutes.home);
            return false;
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(Get.height * 0.08),
              child: AppBar(
                scrolledUnderElevation: 0,
                title: const Text('Profile'),
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Get.offAllNamed(AppRoutes.home),
                ),
                automaticallyImplyLeading: false,
                titleSpacing: 0, // Remove padding between title and icon
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: Get.height * 0.03),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: (Get.width * 0.3).clamp(80.0, 120.0),
                                height: (Get.width * 0.3).clamp(80.0, 120.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[200],
                                  border: Border.all(
                                    color: Colors.grey[400]!,
                                    width: 2,
                                  ),
                                ),
                                child: Obx(() {
                                  if (controller.avatarPath.isEmpty) {
                                    return const Icon(
                                      Icons.person,
                                      size: 60,
                                      color: Colors.grey,
                                    );
                                  } else {
                                    return ClipOval(
                                      child: Image.asset(
                                        controller.avatarPath.value,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  }
                                }),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.dialog(
                                        EditAvatarDialog(
                                          controller: controller,
                                        ),
                                        barrierDismissible: false);
                                  },
                                  child: Container(
                                    width: (Get.width * 0.08).clamp(30.0, 40.0),
                                    height:
                                        (Get.width * 0.08).clamp(30.0, 40.0),
                                    padding: const EdgeInsets.all(6),
                                    decoration: const BoxDecoration(
                                      color: Colors.orange,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height * 0.02),
                          // Name Text
                          Obx(
                            () {
                              return Text(
                                controller.userName.value,
                                style: TextStyle(
                                  fontSize:
                                      (Get.width * 0.05).clamp(16.0, 24.0),
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: Get.height * 0.08),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.materials.length,
                            itemBuilder: (context, index) {
                              final item = controller.materials[index];
                              return MenuItemlist(
                                title: item.title,
                                icon: item.icon,
                                onTap: () {
                                  if (index == 0) {
                                    Get.dialog(
                                        EditNameDialog(
                                          controller: controller,
                                        ),
                                        barrierDismissible: false);
                                  } else if (index == 1) {
                                    Get.toNamed(AppRoutes.tentangKami);
                                  } else if (index == 2) {
                                    // Handle source and reference
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
