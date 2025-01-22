import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_ta/core/routes/app_routes.dart';
import 'package:project_ta/modules/materipagescreen/controller/materi_page_controller.dart';
import 'package:project_ta/modules/materipagescreen/widgets/customheader_materi.dart';
import 'package:project_ta/modules/materipagescreen/widgets/pembelajarandua.dart';
import 'package:project_ta/modules/materipagescreen/widgets/pembelajaransatu.dart';
import 'package:project_ta/modules/materipagescreen/widgets/pembelajarantiga.dart';
import 'package:project_ta/widgets/custom_button.dart';

class MateriPageScreen extends StatelessWidget {
  const MateriPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int args = Get.arguments ?? 0;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return GetBuilder<MateriPageController>(
      init: MateriPageController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomheaderMateri(
                  args: args,
                ),
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
