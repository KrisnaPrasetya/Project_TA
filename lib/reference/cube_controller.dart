
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CubeController extends GetxController {
  final rotationX = 0.0.obs;
  final rotationY = 0.0.obs;
  final rotationZ = 0.0.obs;

  Offset? _previousOffset;

  void handlePanDown(Offset localPosition) {
    _previousOffset = localPosition;
  }

  void handlePanUpdate(Offset localPosition) {
    if (_previousOffset == null) return;

    final dx = localPosition.dx - _previousOffset!.dx;
    final dy = localPosition.dy - _previousOffset!.dy;

    rotationY.value += dx / 100;
    rotationX.value += dy / 100;

    _previousOffset = localPosition;
  }

  void handlePanEnd() {
    _previousOffset = null;
  }

  void updateRotationX(double value) => rotationX.value = value;
  void updateRotationY(double value) => rotationY.value = value;
  void updateRotationZ(double value) => rotationZ.value = value;
}