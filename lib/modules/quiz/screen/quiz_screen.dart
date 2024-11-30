import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/quiz/controller/quiz_controller.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      init: QuizController(),
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
