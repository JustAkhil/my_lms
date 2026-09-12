import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final String fullName;
  final String email;
  final String? photoUrl;
  final String? phoneNo;
  final String? bio;
  final ProfileStats stats;

  const ProfileModel({
    required this.fullName,
    required this.email,
    this.photoUrl,
    this.phoneNo,
    this.bio,
    required this.stats,
  });

  ProfileModel copyWith({
    String? fullName,
    String? email,
    String? photoUrl,
    String? phoneNo,
    String? bio,
    ProfileStats? stats,
  }) {
    return ProfileModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      phoneNo: phoneNo ?? this.phoneNo,
      bio: bio ?? this.bio,
      stats: stats ?? this.stats,
    );
  }

  @override
  List<Object?> get props => [fullName, email, photoUrl, phoneNo, bio, stats];
}

class ProfileStats extends Equatable {
  final int courseCount;
  final int hoursSpent;
  final double successRate;

  const ProfileStats({
    required this.courseCount,
    required this.hoursSpent,
    required this.successRate,
  });

  @override
  List<Object?> get props => [courseCount, hoursSpent, successRate];
}
