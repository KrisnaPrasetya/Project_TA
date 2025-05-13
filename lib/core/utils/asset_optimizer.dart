import 'dart:io';
import 'package:path/path.dart' as path;

class AssetOptimizer {
  static Future<void> optimizeAssets() async {
    final projectDir = Directory.current.path;
    final assetsDir = path.join(projectDir, 'assets');

    print('Starting asset optimization...');

    // Remove unused Lottie animations
    final unusedLottieFiles = ['timer.json', 'confetti.json', 'correct.json'];

    for (final file in unusedLottieFiles) {
      final filePath = path.join(assetsDir, 'lottie', file);
      if (File(filePath).existsSync()) {
        print('Removing unused Lottie animation: $file');
        await File(filePath).delete();
      }
    }

    // Optimize images
    final imageDirs = ['images', 'icons', 'kuis_images'];

    for (final dir in imageDirs) {
      final dirPath = path.join(assetsDir, dir);
      if (Directory(dirPath).existsSync()) {
        print('Optimizing images in $dir...');
        await _optimizeImagesInDirectory(dirPath);
      }
    }

    // Optimize videos
    final videoDir = path.join(assetsDir, 'videos');
    if (Directory(videoDir).existsSync()) {
      print('Optimizing videos...');
      await _optimizeVideosInDirectory(videoDir);
    }

    print('Asset optimization completed!');
  }

  static Future<void> _optimizeImagesInDirectory(String dirPath) async {
    final dir = Directory(dirPath);
    await for (final entity in dir.list(recursive: true)) {
      if (entity is File) {
        final ext = path.extension(entity.path).toLowerCase();
        if (['.png', '.jpg', '.jpeg'].contains(ext)) {
          print('Optimizing image: ${entity.path}');
          // Here you would implement image optimization
          // For now, we'll just print the file size
          final size = await entity.length();
          print('File size: ${(size / 1024).toStringAsFixed(2)} KB');
        }
      }
    }
  }

  static Future<void> _optimizeVideosInDirectory(String dirPath) async {
    final dir = Directory(dirPath);
    await for (final entity in dir.list(recursive: true)) {
      if (entity is File) {
        final ext = path.extension(entity.path).toLowerCase();
        if (['.mp4', '.mov', '.avi'].contains(ext)) {
          print('Optimizing video: ${entity.path}');
          // Here you would implement video optimization
          // For now, we'll just print the file size
          final size = await entity.length();
          print('File size: ${(size / (1024 * 1024)).toStringAsFixed(2)} MB');
        }
      }
    }
  }
}
