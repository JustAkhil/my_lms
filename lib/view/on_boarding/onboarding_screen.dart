import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_lms/core/theme/app_colors.dart';
import 'package:my_lms/models/onboarding_items.dart';
import 'package:my_lms/routes/app_routes.dart';
import 'package:my_lms/widgets/onboarding_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../service/storage_service.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currPage = 0;

  void _completeOnBoarding()async{
    await StorageService.setFirstTime(value: false);
    Get.offAllNamed(AppRoutes.login);
  }

  List<OnBoardingModel> get _pages => [
    OnBoardingModel(
      image: 'assets/images/onboarding/onboarding1.png',
      title: 'Learn Anywhere',
      desc:
          'Access your courses anytime, anywhere. Learn at your own pace with our flexible learning platform.',
    ),
    OnBoardingModel(
      image: 'assets/images/onboarding/onboarding2.png',
      title: 'Interactive Learning',
      desc:
          'Engage with interactive quizzes, live sessions, and hands-on projects to enhance your learning experience.',
    ),
    OnBoardingModel(
      image: 'assets/images/onboarding/onboarding3.png',
      title: 'Track Progress',
      desc:
          'Monitor your progress, earn certificates, and achieve your learning goals with detailed analytics.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                _currPage = index;
              });
            },
            itemBuilder: (_, index) {
              return OnBoardingWidget(pages: _pages[index]);
            },
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: _pages.length,
                  effect: const WormEffect(
                    activeDotColor: Colors.white,
                    dotColor: Colors.white54,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 8,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currPage == _pages.length - 1) {
                      _completeOnBoarding();
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    _currPage == _pages.length - 1 ? "Get Started" : "Next",
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
