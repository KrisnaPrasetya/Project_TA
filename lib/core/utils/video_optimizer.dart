import 'dart:io';
import 'package:path/path.dart' as path;

class VideoOptimizer {
  static Future<void> optimizeVideo(String inputPath) async {
    final file = File(inputPath);
    if (!file.existsSync()) return;

    final dir = path.dirname(inputPath);
    final fileName = path.basename(inputPath);
    final outputPath = path.join(dir, 'optimized_$fileName');

    // FFmpeg command to compress video
    final process = await Process.start('ffmpeg', [
      '-i', inputPath,
      '-c:v', 'libvpx-vp9', // Use VP9 codec for better compression
      '-crf',
      '30', // Constant Rate Factor (lower = better quality, higher = smaller size)
      '-b:v', '0', // Variable bitrate
      '-c:a', 'libopus', // Audio codec
      '-b:a', '128k', // Audio bitrate
      outputPath
    ]);

    await process.exitCode;

    if (File(outputPath).existsSync()) {
      // Replace original file with optimized version
      await file.delete();
      await File(outputPath).copy(inputPath);
    }
  }

  static Future<void> optimizeDirectory(String directoryPath) async {
    final dir = Directory(directoryPath);
    if (!dir.existsSync()) return;

    await for (final entity in dir.list(recursive: true)) {
      if (entity is File) {
        final ext = path.extension(entity.path).toLowerCase();
        if (['.mp4', '.mov', '.avi'].contains(ext)) {
          await optimizeVideo(entity.path);
        }
      }
    }
  }
}
