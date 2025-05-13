import 'package:project_ta/core/utils/asset_optimizer.dart';

void main() async {
  try {
    await AssetOptimizer.optimizeAssets();
  } catch (e) {
    print('Error during optimization: $e');
  }
}
