import 'package:equatable/equatable.dart';
import 'package:my_lms/models/user_model.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthStateChange extends AuthEvent {
  final UserModel userModel;

  AuthStateChange({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}

class RegisterUserEvent extends AuthEvent {
  final String email;
  final String pass;
  final String fullName;
  final String role;

  const RegisterUserEvent({
    required this.email,
    required this.pass,
    required this.fullName,
    required this.role,
  });
  @override
  List<Object?> get props => [email, pass, fullName, role];
}
class LoginUserEvent extends AuthEvent {
  final String email;
  final String pass;
  const LoginUserEvent({
    required this.email,
    required this.pass,
  });
  @override
  List<Object?> get props => [email, pass];
}
class LogoutUserEvent extends AuthEvent {
  const LogoutUserEvent();
}
class ForgotPasswordEvent extends AuthEvent {
  final String email;
  const ForgotPasswordEvent({
    required this.email,
  });
  @override
  List<Object?> get props => [email];
}
class UpdateProfileEvent extends AuthEvent{
  final String fullName;
  final String photoUrl;
  const UpdateProfileEvent({
    required this.fullName,
    required this.photoUrl,
  });
  @override
  List<Object?> get props => [fullName, photoUrl];
}
