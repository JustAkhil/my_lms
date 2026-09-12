import 'package:flutter/cupertino.dart';

class CategoryModel {
  final String id;
  final String name;
  final IconData icon;
  final int courseCount;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.courseCount,
  });
}
