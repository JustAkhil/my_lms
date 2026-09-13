import 'package:get/get.dart';
import 'package:my_lms/routes/app_routes.dart';
import 'package:my_lms/view/splash/splash_screen.dart';

import '../main_page/main_screen.dart';
import '../view/NavPage/courses/course_list/course_list_args.dart';
import '../view/NavPage/courses/course_list/course_list_screen.dart';
import '../view/NavPage/quiz/quiz_list/quiz_list_screen.dart';
import '../view/auth/forgot_password_screen.dart';
import '../view/auth/login.dart';
import '../view/auth/signup.dart';
import '../view/home/home_screen.dart';
import '../view/on_boarding/onboarding_screen.dart';
import '../view/teacher/teacher_home_screen.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.onBoarding, page: () => const OnBoardingScreen()),
    GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.signup, page: () => const SignUpScreen()),
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => MainScreen(initialIndex: Get.arguments as int?),
    ),
    GetPage(name: AppRoutes.teacherHome, page: () => const TeacherHomeScreen()),
    GetPage(name: AppRoutes.courseList, page: (){
      final args = Get.arguments as CourseListArguments?;
      return CourseListScreen(
        categoryId: args?.categoryId,
        categoryName: args?.categoryName,
        showBackButton: args?.showBackButton??false,
      );
    }),
    GetPage(name: AppRoutes.quizList, page: () => const QuizListScreen()),
  ];
}
