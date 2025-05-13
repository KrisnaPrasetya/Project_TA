import 'dart:io';
import 'package:path/path.dart' as path;
import 'image_optimizer.dart';
import 'video_optimizer.dart';

class AssetOptimizer {
  static Future<void> optimizeAllAssets() async {
    final projectDir = Directory.current.path;
    final assetsDir = path.join(projectDir, 'assets');

    print('Starting asset optimization...');

    // Optimize images
    print('Optimizing images...');
    await ImageOptimizer.optimizeDirectory(path.join(assetsDir, 'images'));
    await ImageOptimizer.optimizeDirectory(path.join(assetsDir, 'icons'));
    await ImageOptimizer.optimizeDirectory(path.join(assetsDir, 'kuis_images'));

    // Optimize videos
    print('Optimizing videos...');
    await VideoOptimizer.optimizeDirectory(path.join(assetsDir, 'videos'));

    print('Asset optimization completed!');
  }
}
