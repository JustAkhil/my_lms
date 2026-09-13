import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_lms/bloc/navigation/navigation_bloc.dart';
import 'package:my_lms/bloc/navigation/navigation_event.dart';
import 'package:my_lms/core/theme/app_colors.dart';
import 'package:my_lms/view/NavPage/profile/profile_screen.dart';
import 'package:my_lms/view/NavPage/quiz/quiz_list/quiz_list_screen.dart';
import 'package:my_lms/view/home/home_screen.dart';

import '../bloc/navigation/navigation_state.dart';
import '../view/NavPage/courses/course_list/course_list_screen.dart';

class MainScreen extends StatelessWidget {
  final int? initialIndex;

  const MainScreen({super.key, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      NavigationBloc()
        ..add(NavigateToTabEvent(tabIndex: initialIndex ?? 0)),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.lightBackground,
            body: IndexedStack(
              index: state.currIndex,
              children: [
                HomeScreen(),
                CourseListScreen(
                ),
                const QuizListScreen(),
                const ProfileScreen(),
              ],
            ),
            bottomNavigationBar: NavigationBar(
              backgroundColor: AppColors.accent,
              indicatorColor: AppColors.primary.withOpacity(0.1),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.play_lesson_outlined),
                  selectedIcon: Icon(Icons.play_lesson),
                  label: 'My Courses',
                ),
                NavigationDestination(
                  icon: Icon(Icons.quiz_outlined),
                  selectedIcon: Icon(Icons.quiz),
                  label: 'Quizzes',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outline_outlined),
                  selectedIcon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              selectedIndex: state.currIndex,
              onDestinationSelected: (index) {
                context.read<NavigationBloc>().add(
                    NavigateToTabEvent(tabIndex: index));
              },
            ),
          );
        },
      ),
    );
  }
}
