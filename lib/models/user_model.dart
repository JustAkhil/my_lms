import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String uid;
  final String email;
  final String? fullName;
  final String photoUrl;
  final DateTime createdAt;
  final DateTime lastLoginAt;
  final UserRole role;

  const UserModel({
    required this.uid,
    required this.email,
    this.fullName,
    required this.photoUrl,
    required this.createdAt,
    required this.lastLoginAt,
    required this.role,
  });

  @override
  List<Object?> get props => [
    uid,
    email,
    fullName,
    photoUrl,
    createdAt,
    lastLoginAt,
    role,
  ];
}

enum UserRole {
  Student,
  Teacher,
}