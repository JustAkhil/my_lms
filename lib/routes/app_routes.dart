import 'package:flutter/material.dart';
import 'package:my_lms/main_page/main_screen.dart';
import 'package:my_lms/view/auth/forgot_password_screen.dart';
import 'package:my_lms/view/auth/login.dart';
import 'package:my_lms/view/auth/signup.dart';
import 'package:my_lms/view/home/home_screen.dart';
import 'package:my_lms/view/on_boarding/onboarding_screen.dart';
import 'package:my_lms/view/splash/splash_screen.dart';

import '../view/NavPage/courses/course_list/course_list_screen.dart';
import '../view/NavPage/profile/profile_screen.dart';
import '../view/NavPage/quiz/quiz_list/quiz_list_screen.dart';
import '../view/teacher/teacher_home_screen.dart';

class AppRoutes {
  // main
  static const String main = "/main";

  // auth routes
  static const String splash = "/splash";
  static const String onBoarding = "/onBoarding";
  static const String login = "/login";
  static const String signup = "/signup";
  static const String home = "/home";
  static const String forgotPassword = "/forgotPassword";

  //course route
  static const String courseList = "/courseList";

  //course route
  static const String quizList = "/quizList";

  //profile route
  static const String profile = "/profile";

  // teacher
  static const String teacherHome = "/teacher/Home";

  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case onBoarding:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());

      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case main:
        return MaterialPageRoute(
          builder: (_) => MainScreen(initialIndex: settings.arguments as int?),
        );
      case teacherHome:
        return MaterialPageRoute(builder: (_) => TeacherHomeScreen());
      case courseList:
        return MaterialPageRoute(builder: (_) => CourseListScreen());
      case quizList:
        return MaterialPageRoute(builder: (_) => QuizListScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Page not found"))),
        );
    }
  }
}
