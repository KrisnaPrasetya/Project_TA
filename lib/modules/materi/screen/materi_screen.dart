import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/core/routes/app_routes.dart';
import 'package:project_ta/modules/materi/controller/materi_controller.dart';
import 'package:project_ta/modules/materi/widgets/custom_header_materi.dart';
import 'package:project_ta/modules/materi/widgets/item_list_materi.dart';
import 'package:project_ta/widgets/custom_snackbar.dart';

class MateriMenuScreen extends StatelessWidget {
  const MateriMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MateriController>(
      init: MateriController(),
      builder: (controller) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeaderMateri(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Pilihan Materi",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 220, // Sesuaikan tinggi ListView horizontal
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection:
                        Axis.horizontal, // Mengatur menjadi horizontal
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ItemListMateri(    
                        title: index == 0
                            ? "Kubus dan Balok"
                            : "Segera hadir...",
                        progress: 0.552,
                        isProgress: index == 0,
                        onTap: () {
                          if (index == 0) {
                            Get.toNamed(AppRoutes.detailMateri);
                          } else {
                            CustomSnackbar.showSnackbar(
                              title: "Akan Segera Hadir!",
                              lottieAsset: 'assets/lottie/wrong.json',
                              message:
                                  "Materi ini sedang dalam tahap pengembangan.",
                              backgroundColor: Colors.red[300]!,
                              textColor: Colors.white,
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
