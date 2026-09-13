import 'package:flutter/material.dart';
import 'package:my_lms/view/NavPage/quiz/quiz_list/widget/quiz_card.dart';
import 'package:my_lms/view/home/widgets/home_app_bar.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../service/dummy_data/dummy_data_service.dart';

class QuizListScreen extends StatelessWidget {
  const QuizListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            backgroundColor: AppColors.primary,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.all(16),
              title: Text(
                "Quizzes",
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: AppColors.accent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryLight],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList.builder(
              itemCount: DummyDataService.quizzes.length,
              itemBuilder: (context, index) {
                final quiz = DummyDataService.quizzes[index];
                return QuizCard(
                  title: quiz.title,
                  description: quiz.desc,
                  questionCount: quiz.questions.length,
                  timeLimit: quiz.timeLimit,
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
