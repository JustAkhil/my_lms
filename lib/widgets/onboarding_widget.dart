import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_lms/models/onboarding_items.dart';

import '../core/theme/app_colors.dart';

class OnBoardingWidget extends StatelessWidget {
  final OnBoardingModel pages;

  const OnBoardingWidget({super.key, required this.pages});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Get.height * 0.4,
              padding: const EdgeInsets.all(32),
              child: Image.asset(pages.image, fit: BoxFit.cover),
            ),
            const SizedBox(height: 40,),
            Text(
              pages.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                pages.desc,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  letterSpacing: 1.5
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
