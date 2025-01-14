import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/profile/controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(Get.height * 0.08),
            child: AppBar(
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Get.back(),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    // Handle settings tap
                  },
                ),
              ],
              automaticallyImplyLeading: false,
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
                        // Profile Picture Container
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
                            // Edit Icon Badge
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () {
                                  // Handle edit avatar
                                },
                                child: Container(
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
                        Obx(() {
                          return Text(
                            controller.userName.value,
                            style: TextStyle(
                              fontSize: (Get.width * 0.05).clamp(16.0, 24.0),
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
