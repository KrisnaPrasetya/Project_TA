import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/reference/cube_controller.dart';

class CubePage extends StatelessWidget {
  CubePage({Key? key}) : super(key: key);

  final CubeController controller = Get.put(CubeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3D Cube - GetX')),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onPanDown: (details) => controller.handlePanDown(details.localPosition),
              onPanUpdate: (details) => controller.handlePanUpdate(details.localPosition),
              onPanEnd: (details) => controller.handlePanEnd(),
              child: Obx(
                () => Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.002)
                    ..rotateX(controller.rotationX.value)
                    ..rotateY(controller.rotationY.value)
                    ..rotateZ(controller.rotationZ.value),
                  alignment: Alignment.center,
                  child: _buildCube(),
                ),
              ),
            ),
          ),
          _buildSliders(),
        ],
      ),
    );
  }

  Widget _buildCube() {
    const size = 100.0;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          // Front face
          Transform(
            transform: Matrix4.identity()..translate(0.0, 0.0, size / 2),
            child: _buildFace(Colors.red, size),
          ),
          // Back face
          Transform(
            transform: Matrix4.identity()..translate(0.0, 0.0, -size / 2),
            child: _buildFace(Colors.orange, size),
          ),
          // Left face
          Transform(
            transform: Matrix4.identity()
              ..translate(-size / 2, 0.0, 0.0)
              ..rotateY(math.pi / 2),
            child: _buildFace(Colors.blue, size),
          ),
          // Right face
          Transform(
            transform: Matrix4.identity()
              ..translate(size / 2, 0.0, 0.0)
              ..rotateY(-math.pi / 2),
            child: _buildFace(Colors.green, size),
          ),
          // Top face
          Transform(
            transform: Matrix4.identity()
              ..translate(0.0, -size / 2, 0.0)
              ..rotateX(-math.pi / 2),
            child: _buildFace(Colors.yellow, size),
          ),
          // Bottom face
          Transform(
            transform: Matrix4.identity()
              ..translate(0.0, size / 2, 0.0)
              ..rotateX(math.pi / 2),
            child: _buildFace(Colors.purple, size),
          ),
        ],
      ),
    );
  }

  Widget _buildFace(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }

  Widget _buildSliders() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Obx(() => _buildSlider(
                'Rotasi X:',
                controller.rotationX.value,
                (value) => controller.updateRotationX(value),
              )),
          Obx(() => _buildSlider(
                'Rotasi Y:',
                controller.rotationY.value,
                (value) => controller.updateRotationY(value),
              )),
          Obx(() => _buildSlider(
                'Rotasi Z:',
                controller.rotationZ.value,
                (value) => controller.updateRotationZ(value),
              )),
        ],
      ),
    );
  }

  Widget _buildSlider(String label, double value, Function(double) onChanged) {
    return Row(
      children: [
        Text(label),
        Expanded(
          child: Slider(
            value: value,
            min: -math.pi,
            max: math.pi,
            divisions: 100,
            label: value.toStringAsFixed(2),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}