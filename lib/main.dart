import 'package:flutter/material.dart';

import 'core/base/base_app.dart';
import 'core/base/base_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BaseController.initialize();
  runApp(const BaseApp());
}