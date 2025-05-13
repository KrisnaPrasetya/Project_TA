import 'package:project_ta/core/utils/optimize_assets.dart';

void main() async {
  try {
    await AssetOptimizer.optimizeAllAssets();
  } catch (e) {
    print('Error during optimization: $e');
  }
}
