
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/hompage/model/history_model.dart';

class HomepageMenuController extends GetxController {
  final _secureStorage = const FlutterSecureStorage();
  RxList<LearningHistory> learningHistory = <LearningHistory>[].obs;

  Future<String> loadAvatar() async {
    String? avatarPath = await _secureStorage.read(key: 'avatar');
    return avatarPath ?? '';
  }

  Future<String> loadName() async {
    String? name = await _secureStorage.read(key: 'name');
    return name ?? 'User';
  }
  
  Future<void> loadLearningHistory() async {
    try {
      developer.log('Loading learning history...');
      String? historyJson = await _secureStorage.read(key: 'learning_history');
      
      if (historyJson == null || historyJson.isEmpty) {
        developer.log('No learning history found in storage');
        learningHistory.clear();
        return;
      }
      
      developer.log('Learning history JSON: ${historyJson.substring(0, min(100, historyJson.length))}...');
      
      List<dynamic> historyData = json.decode(historyJson);
      developer.log('Parsed ${historyData.length} history items from JSON');
      
      List<LearningHistory> history = historyData
          .map((item) => LearningHistory.fromJson(item))
          .toList();
      
      developer.log('Converted ${history.length} items to LearningHistory objects');
      learningHistory.assignAll(history);
      
      // Force UI update
      update();
      developer.log('Learning history loaded successfully: ${learningHistory.length} items');
    } catch (e) {
      developer.log('ERROR loading learning history: $e');
      learningHistory.clear();
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    developer.log('HomepageMenuController initialized');
    loadAvatar();
    loadName();
    loadLearningHistory();
  }
  
  // Override onResume to refresh when coming back to this screen
  void onResume() {
    developer.log('HomepageMenuController resumed - refreshing learning history');
    loadLearningHistory();
  }
  
  @override
  void onReady() {
    super.onReady();
    // Refresh learning history whenever the homepage appears
    developer.log('HomepageMenuController ready - refreshing learning history');
    loadLearningHistory();
    
    // A simpler approach - just set up a listener for GetX navigation events
    Get.rootController.addListener(() {
      if (Get.currentRoute == '/home') {
        developer.log('Detected navigation to home - refreshing learning history');
        loadLearningHistory();
      }
    });
  }
  
  // Helper function for string length
  int min(int a, int b) {
    return a < b ? a : b;
  }

  @override
  void onClose() {
    super.onClose();
  }
  
  String formatDate(DateTime date) {
    return '${date.day} ${_getMonthName(date.month)} ${date.year}';
  }
  
  String _getMonthName(int month) {
    switch (month) {
      case 1: return 'Januari';
      case 2: return 'Februari';
      case 3: return 'Maret';
      case 4: return 'April';
      case 5: return 'Mei';
      case 6: return 'Juni';
      case 7: return 'Juli';
      case 8: return 'Agustus';
      case 9: return 'September';
      case 10: return 'Oktober';
      case 11: return 'November';
      case 12: return 'Desember';
      default: return '';
    }
  }
}