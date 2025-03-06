
class LearningHistory {
  final int materialId;
  final String title;
  final double progress;
  final DateTime lastAccessed;

  LearningHistory({
    required this.materialId,
    required this.title,
    required this.progress,
    required this.lastAccessed,
  });

  Map<String, dynamic> toJson() {
    return {
      'materialId': materialId,
      'title': title,
      'progress': progress,
      'lastAccessed': lastAccessed.toIso8601String(),
    };
  }

  factory LearningHistory.fromJson(Map<String, dynamic> json) {
    return LearningHistory(
      materialId: json['materialId'],
      title: json['title'],
      progress: json['progress'],
      lastAccessed: DateTime.parse(json['lastAccessed']),
    );
  }
}