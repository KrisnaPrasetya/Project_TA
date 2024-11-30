import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/materi/controller/materi_controller.dart';

class MateriMenuScreen extends StatelessWidget {
  const MateriMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MateriController>(
      init: MateriController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Homepage Menu'),
          ),
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.red),
                child: Text("hello 1"),
              )
            ],
          ),
        );
      },
    );
  }
}
