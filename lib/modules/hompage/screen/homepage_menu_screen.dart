import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/hompage/controller/homepage_menu_controller.dart';
import 'package:project_ta/modules/hompage/widgets/custom_header.dart';
import 'package:project_ta/modules/hompage/widgets/menu_list%20item.dart';
import 'package:project_ta/modules/detailmateri/controller/materi_controller.dart';

class HomepageMenuScreen extends StatefulWidget {
  const HomepageMenuScreen({super.key});

  @override
  State<HomepageMenuScreen> createState() => _HomepageMenuScreenState();
}

class _HomepageMenuScreenState extends State<HomepageMenuScreen>
    with WidgetsBindingObserver {
  late HomepageMenuController controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    controller = Get.put(HomepageMenuController());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      developer.log('App resumed - refreshing learning history');
      controller.loadLearningHistory();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Ensure history is loaded when screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadLearningHistory();
    });

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        // Refresh when returning to this screen
        if (!didPop) {
          controller.loadLearningHistory();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<HomepageMenuController>(
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeader(
                  controller: controller,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Riwayat belajar kamu",
                        style: TextStyle(fontSize: 16),
                      ),
                      // Debug refresh button
                      IconButton(
                        icon: Icon(Icons.refresh, size: 18),
                        onPressed: () {
                          developer.log('Manual refresh triggered');
                          controller.loadLearningHistory();
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Obx(() {
                    developer.log(
                        'Building history list with ${controller.learningHistory.length} items');

                    if (controller.learningHistory.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Belum ada riwayat belajar",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      itemCount: controller.learningHistory.length,
                      itemBuilder: (context, index) {
                        final history = controller.learningHistory[index];
                        developer
                            .log('Building history item: ${history.title}');

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: ProgressItemList(
                            title: history.title,
                            progress: history.progress /
                                100, // Convert to 0.0-1.0 range
                            subtitle:
                                'Terakhir dikerjakan pada ${controller.formatDate(history.lastAccessed)}',
                            onTap: () {
                              developer.log(
                                  'Tapped history item: ${history.materialId}');
                              try {
                                // Find the index of this material in MateriPageController
                                if (Get.isRegistered<MateriPageController>()) {
                                  final materiController =
                                      Get.find<MateriPageController>();
                                  developer.log(
                                      'Found MateriPageController with ${materiController.materials.length} materials');

                                  final materialIndex =
                                      materiController.materials.indexWhere(
                                          (m) => m.id == history.materialId);

                                  developer.log(
                                      'Material index: $materialIndex for ID: ${history.materialId}');

                                  if (materialIndex != -1) {
                                    // Navigate to the detail screen
                                    Get.toNamed('/detail-materi',
                                        arguments: materialIndex);
                                  } else {
                                    // Fallback - just use materialId as the index
                                    Get.toNamed('/detail-materi',
                                        arguments: history.materialId);
                                  }
                                } else {
                                  developer.log(
                                      'MateriPageController not found - using direct navigation');
                                  // Fallback - navigate directly with materialId
                                  Get.toNamed('/detail-materi',
                                      arguments: history.materialId);
                                }
                              } catch (e) {
                                developer
                                    .log('ERROR navigating to material: $e');
                                // Last resort fallback
                                Get.toNamed('/detail-materi', arguments: 0);
                              }
                            },
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
