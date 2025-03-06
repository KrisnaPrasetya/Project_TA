
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/detailmateri/controller/materi_controller.dart';
import 'package:project_ta/modules/hompage/controller/homepage_menu_controller.dart';
import 'package:project_ta/modules/hompage/model/history_model.dart';

class DetailMateriController extends GetxController {
  late ScrollController scrollController;
  late int materialId;
  late String materialTitle;
  double lastSavedProgress = 0;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  bool _isMaxScrollCalculated = false;

  @override
  void onInit() {
    super.onInit();
    final int args = Get.arguments ?? 0;
    
    // Add debug logs to check material data
    var materiController = Get.find<MateriPageController>();
    developer.log('MaterialController materials length: ${materiController.materials.length}');
    developer.log('Material index from arguments: $args');
    
    try {
      // Safely access the material data
      if (args < materiController.materials.length) {
        var material = materiController.materials[args];
        
        // Add debug log to check material structure
        developer.log('Material data: ${material.toString()}');
        
        // Extract material ID and title
        materialId = material.id;
        materialTitle = material.title ?? 'Untitled Material';
        
        developer.log('Successfully extracted materialId: $materialId, title: $materialTitle');
      } else {
        developer.log('ERROR: Index out of bounds - fallback to defaults');
        materialId = args; // Use the args as ID in fallback
        materialTitle = 'Materi $args'; // Fallback title
      }
    } catch (e) {
      developer.log('ERROR extracting material data: $e');
      materialId = args; // Use the args as ID in fallback
      materialTitle = 'Materi $args'; // Fallback title
    }
    
    scrollController = ScrollController();
    _initScroll();
    // _loadInitialProgress();
    
    // Save to learning history when accessed - use Future.delayed to ensure
    // controller is fully initialized before accessing storage
    Future.delayed(Duration.zero, () {
      _saveToLearningHistory();
    });
  }

  Future<void> _saveToLearningHistory() async {
    try {
      developer.log('Saving to learning history: Material ID: $materialId, Title: $materialTitle');
      
      // Load current progress if available
      String? savedProgressStr = await _storage.read(key: 'progress_material_$materialId');
      double currentProgress = 0.0;
      
      if (savedProgressStr != null && savedProgressStr.isNotEmpty) {
        currentProgress = double.tryParse(savedProgressStr) ?? 0.0;
        developer.log('Loaded saved progress: $currentProgress');
      }
      
      // Create a new history entry
      final history = LearningHistory(
        materialId: materialId,
        title: materialTitle,
        progress: currentProgress > lastSavedProgress ? currentProgress : lastSavedProgress,
        lastAccessed: DateTime.now(),
      );

      // Get existing history
      List<LearningHistory> historyList = await _getLearningHistory();
      developer.log('Current history items: ${historyList.length}');

      // Check if this material already exists in history
      int existingIndex = historyList.indexWhere((item) => item.materialId == materialId);
      
      if (existingIndex != -1) {
        developer.log('Material already in history at position: $existingIndex - updating');
        // Remove the existing entry
        historyList.removeAt(existingIndex);
      }
      
      // Add the new/updated entry at the beginning (most recent)
      historyList.insert(0, history);
      developer.log('Added/updated history entry at position 0');
      
      // Limit history to the last 10 items (optional)
      if (historyList.length > 10) {
        historyList = historyList.sublist(0, 10);
        developer.log('Limited history to 10 items');
      }
      
      // Save the updated history
      await _saveLearningHistory(historyList);
      developer.log('Learning history saved successfully');
    } catch (e) {
      developer.log('ERROR saving learning history: $e');
    }
  }
  
  Future<List<LearningHistory>> _getLearningHistory() async {
    try {
      String? historyJson = await _storage.read(key: 'learning_history');
      if (historyJson == null || historyJson.isEmpty) {
        developer.log('No existing learning history found');
        return [];
      }
      
      List<dynamic> historyData = json.decode(historyJson);
      var result = historyData.map((item) => LearningHistory.fromJson(item)).toList();
      developer.log('Successfully loaded ${result.length} history items');
      return result;
    } catch (e) {
      developer.log('ERROR loading learning history: $e');
      return [];
    }
  }
  
  Future<void> _saveLearningHistory(List<LearningHistory> historyList) async {
    try {
      final historyJson = json.encode(historyList.map((e) => e.toJson()).toList());
      await _storage.write(key: 'learning_history', value: historyJson);
      
      // Force refresh the homepage if it exists
      if (Get.isRegistered<HomepageMenuController>()) {
        developer.log('Refreshing HomepageMenuController');
        Get.find<HomepageMenuController>().loadLearningHistory();
      }
    } catch (e) {
      developer.log('ERROR saving learning history to storage: $e');
    }
  }

  void _initScroll() {
    scrollController.addListener(_scrollListener);

    // Tunggu sampai layout selesai
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkMaxScroll();
    });
  }

  void _checkMaxScroll() {
    if (scrollController.hasClients &&
        scrollController.position.maxScrollExtent > 0) {
      _isMaxScrollCalculated = true;
    }
  }

  void _scrollListener() {
    if (!_isMaxScrollCalculated) return;

    final position = scrollController.position;
    double progress = (position.pixels / position.maxScrollExtent) * 100;

    // Hitung milestone progress
    double newProgress = _calculateMilestone(progress);

    // Update hanya jika progress meningkat
    if (newProgress > lastSavedProgress) {
      lastSavedProgress = newProgress;
      _saveProgress(newProgress);
      
      // Also update the learning history when progress changes
      _saveToLearningHistory();
    }
  }

  double _calculateMilestone(double progress) {
    if (progress >= 95) return 100; // Beri toleransi 5% untuk scroll akhir
    if (progress >= 70) return 75;
    if (progress >= 45) return 50;
    if (progress >= 20) return 25;
    return 0;
  }

  Future<void> _saveProgress(double progress) async {
    await _storage.write(
      key: 'progress_material_$materialId',
      value: progress.toString(),
    );

    // Update progress di MateriPageController
    Get.find<MateriPageController>().updateProgress(materialId, progress);
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }
}
