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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return GetBuilder<DetailMateriController>(
      init: DetailMateriController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomheaderMateri(
                  args: args,
                ),
                SizedBox(height: Get.height * 0.01),
                if (args == 0)
                  Pembelajaransatu()
                else if (args == 1)
                  Pembelajarandua()
                else if (args == 2)
                  Pembelajarantiga()
                else
                  Center(child: Text('Materi Tidak Ditemukan'))
              ],
            ),
          ),
        );
      },
    );
  }
}
