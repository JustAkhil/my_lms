import 'package:my_lms/models/lessons_model.dart';

class CourseModel {
  final String id;
  final String title;
  final String desc;
  final String imgUrl;
  final String instructorId;
  final String categoryId;
  final double price;
  final List<LessonsModel> lessons;
  final double rating;
  final int reviewCount;
  final int enrollmentCount;
  final String level;
  final List<String> requirements;
  final List<String> whatYouWillLearned;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isPremium;

  const CourseModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.imgUrl,
    required this.instructorId,
    required this.categoryId,
    required this.price,
    required this.lessons,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.enrollmentCount = 0,
    required this.level,
    required this.requirements,
    required this.whatYouWillLearned,
    required this.createdAt,
    required this.updatedAt,
    this.isPremium = false,
  });

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'],
      title: map['title'],
      desc: map['desc'],
      imgUrl: map['imgUrl'],
      instructorId: map['instructorId'],
      categoryId: map['categoryId'],
      price: map['price']?.toDouble(),
      lessons: (map['lessons'] as List)
          .map((lesson) => LessonsModel.fromMap(lesson))
          .toList(),
      rating: map['rating']?.toDouble() ?? 0.0,
      reviewCount: map['reviewCount'] ?? 0,
      enrollmentCount: map['enrollmentCount'] ?? 0,
      level: map['level'],
      requirements: List.from(map['requirements']),
      whatYouWillLearned: List.from(map['whatYouWillLearned']),
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      isPremium: map['isPremium'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'desc': desc,
      'imgUrl': imgUrl,
      'instructorId': instructorId,
      'categoryId': categoryId,
      'price': price,
      'lessons': lessons.map((lesson) => lesson.toMap()).toList(),
      'rating': rating,
      'reviewCount': reviewCount,
      'enrollmentCount': enrollmentCount,
      'level': level,
      'requirements': requirements,
      'whatYouWillLearned': whatYouWillLearned,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isPremium': isPremium,
    };
  }
}
