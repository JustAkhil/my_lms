import 'package:get/get.dart';
import 'package:my_lms/routes/app_routes.dart';
import 'package:my_lms/view/splash/splash_screen.dart';

import '../view/auth/forgot_password_screen.dart';
import '../view/auth/login.dart';
import '../view/auth/signup.dart';
import '../view/home/home_screen.dart';
import '../view/on_boarding/onboarding_screen.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.onBoarding, page: () => const OnBoardingScreen()),
    GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.signup, page: () => const SignUpScreen()),
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
    ),
  ];
}
