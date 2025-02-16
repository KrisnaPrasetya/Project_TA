import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/materipagescreen/controller/materi_page_controller.dart';
import 'package:project_ta/modules/materipagescreen/widgets/customheader_materi.dart';
import 'package:project_ta/modules/materipagescreen/widgets/pembelajarandua.dart';
import 'package:project_ta/modules/materipagescreen/widgets/pembelajaransatu.dart';
import 'package:project_ta/modules/materipagescreen/widgets/pembelajarantiga.dart';
class DetailMateriScreen extends StatelessWidget {
  const DetailMateriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int args = Get.arguments ?? 0;
    
    return GetBuilder<DetailMateriController>(
      init: DetailMateriController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              // Trigger rebuild saat scroll
              controller.update();
              return false;
            },
            child: SingleChildScrollView(
              controller: controller.scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomheaderMateri(args: args),
                  SizedBox(height: Get.height * 0.01),
                  if (args == 0)
                    const Pembelajaransatu() 
                  else if (args == 1)
                    const Pembelajarandua()
                  else if (args == 2)
                    const Pembelajarantiga()
                  else
                    const Center(child: Text('Materi Tidak Ditemukan'))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}