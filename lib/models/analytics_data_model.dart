class AnalyticsDataModel {
  final double completionRate;
  final int totalTimeSpent;
  final double averageQuizScore;
  final Map<String, double> skillsProgress;
  final List<String> recommendations;
  final List<WeeklyProgress> weeklyProgress;
  final Map<String, int> learningStreak;
  final int totalCoursesEnrolled;
  final int certificatesEarned;

  const AnalyticsDataModel({
    required this.completionRate,
    required this.totalTimeSpent,
    required this.averageQuizScore,
    required this.skillsProgress,
    required this.recommendations,
    required this.weeklyProgress,
    required this.learningStreak,
    required this.totalCoursesEnrolled,
    required this.certificatesEarned,
  });

  factory AnalyticsDataModel.fromMap(Map<String, dynamic> map) {
    return AnalyticsDataModel(
      completionRate: map['completionRate']?.toDouble() ?? 0.0,
      totalTimeSpent: map['totalTimeSpent'] ?? 0,
      averageQuizScore: map['averageQuizScore']?.toDouble() ?? 0.0,
      skillsProgress: Map<String, double>.from(map['skillsProgress'] ?? {}),
      recommendations: List<String>.from(map['recommendations'] ?? []),
      weeklyProgress: (map['weeklyProgress'] as List)
          .map((progress) => WeeklyProgress.fromMap(progress))
          .toList(),
      learningStreak: Map<String, int>.from(map['learningStreak']),
      totalCoursesEnrolled: map['totalCoursesEnrolled'] ?? 0,
      certificatesEarned: map['certificatesEarned'] ?? 0,
    );
  }
}

class WeeklyProgress {
  final String day;
  final int totalMinutes;

  WeeklyProgress({required this.day, required this.totalMinutes});

  factory WeeklyProgress.fromMap(Map<String, dynamic> map) {
    return WeeklyProgress(
      day: map['day'] ?? "",
      totalMinutes: map['totalMinutes'] ?? 0,
    );
  }
}
