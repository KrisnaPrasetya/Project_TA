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
    return Column(
      children: [
        Obx(() => Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: HexColor("#9DF4E6"),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.white,
                  width: 4,
                ),
              ),
              child: controller.avatar.value.isEmpty
                  ? Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    )
                  : CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage(controller.avatar.value),
                    ),
            )),
        SizedBox(
          height: 16,
        ),
        Text(
          "Pilih avatar kamu",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Obx(
            () => Wrap(
              alignment: WrapAlignment.center,
              spacing: 16.0,
              runSpacing: 16.0,
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
                        radius: 45,
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
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            CustomButton(
              width: 100,
              height: 50,
              onPressed: () {},
              color: Colors.red,
              child: Text("kembali"),
            ),
            CustomButton(
              width: 100,
              height: 50,
              onPressed: () {},
              color: Colors.green,
              child: Text("Lanjut"),
            ),
          ],
        ),
      ],
    );
  }
}
