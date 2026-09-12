import 'package:my_lms/models/question_model.dart';

class QuizModel {
  final String id;
  final String title;
  final String desc;
  final int timeLimit;
  final List<QuestionModel> questions;
  final DateTime createdAt;
  final bool isActive;

  QuizModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.timeLimit,
    required this.questions,
    required this.createdAt,
    this.isActive = true,
  });

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      id: map['id'] ?? "",
      title: map['title'] ?? "",
      desc: map['desc'] ?? "",
      timeLimit: map['timeLimit'] ?? 30,
      questions: (map['questions'] as List)
          .map((question) => QuestionModel.fromMap(question))
          .toList(),
      createdAt: DateTime.parse(map['createdAt']),
      isActive: map['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'desc': desc,
      'timeLimit': timeLimit,
      'questions': questions.map((question) => question.toMap()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'isActive': isActive,
    };
  }
}
