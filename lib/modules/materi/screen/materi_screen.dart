import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/core/routes/app_routes.dart';
import 'package:project_ta/modules/hompage/widgets/menu_list%20item.dart';
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeaderMateri(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Pilihan Materi",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: 3,
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ItemListMateri(
                        title: index == 0
                            ? "Materi Kubus dan Balok"
                            : "Segera hadir...",
                        progress: 0.80,
                        isProgress: index == 0 ? true : false,
                        subtitle: 'Terakhir dikerjakan pada 28 Desember 2024',
                        onTap: () {
                          index == 0
                              ? Get.toNamed(AppRoutes.detailMateri)
                              : CustomSnackbar.showSnackbar(
                                  title: "Akan Segera Hadir Yahh!",
                                  message:
                                      "Materi ini sedang dalam tahap pengembangan",
                                  lottieAsset:
                                      'assets/lottie/wrong.json', // Path to your Lottie file
                                  backgroundColor: Colors.red[300]!,
                                  textColor: Colors.white,
                                );
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
