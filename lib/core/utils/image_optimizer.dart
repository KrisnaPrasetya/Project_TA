import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as path;

class ImageOptimizer {
  static Future<void> optimizeImage(String inputPath) async {
    final file = File(inputPath);
    if (!file.existsSync()) return;

    final dir = path.dirname(inputPath);
    final fileName = path.basename(inputPath);
    final outputPath = path.join(dir, 'optimized_$fileName');

    final result = await FlutterImageCompress.compressAndGetFile(
      inputPath,
      outputPath,
      quality: 85,
      format: CompressFormat.webp,
    );

    if (result != null) {
      // Replace original file with optimized version
      await file.delete();
      await File(result.path).copy(inputPath);
    }
  }

  static Future<void> optimizeDirectory(String directoryPath) async {
    final dir = Directory(directoryPath);
    if (!dir.existsSync()) return;

    await for (final entity in dir.list(recursive: true)) {
      if (entity is File) {
        final ext = path.extension(entity.path).toLowerCase();
        if (['.png', '.jpg', '.jpeg'].contains(ext)) {
          await optimizeImage(entity.path);
        }
      }
    }
  }
}
