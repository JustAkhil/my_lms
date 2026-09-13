import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_lms/view/NavPage/courses/course_list/widget/course_card.dart';
import 'package:my_lms/view/NavPage/courses/course_list/widget/course_filter_dialog.dart';
import 'package:my_lms/view/NavPage/courses/course_list/widget/empty_state_widget.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../service/dummy_data/dummy_data_service.dart';

class CourseListScreen extends StatelessWidget {
  final String? categoryId;
  final String? categoryName;
  final bool showBackButton;

  const CourseListScreen({
    super.key,
    this.categoryId,
    this.categoryName,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final courses = categoryId != null
        ? DummyDataService.getCoursesByCategory(categoryId!)
        : DummyDataService.courses;
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            backgroundColor: AppColors.primary,
            automaticallyImplyLeading: categoryId != null || showBackButton,
            leading: (categoryId != null || showBackButton)
                ? IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back,color: AppColors.accent,),
                  )
                : null,
            actions: [
              IconButton(
                onPressed: () => _showFilterDialog(context),
                icon: const Icon(Icons.filter_list, color: AppColors.accent),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.all(16),
              title: Text(
                categoryName ?? 'All Courses',
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
          if (courses.isEmpty)
            SliverFillRemaining(
              child: EmptyStateWidget(onActionPressed: () => Get.back()),
            )
          else
            SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: SliverList.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                final course = courses[index];
                return CourseCard(
                  title: course.title,
                  isPremium: course.isPremium,
                  courseId: course.id,
                  subTitle: course.desc,
                  imageUrl: course.imgUrl,
                  rating: course.rating,
                  duration: '${course.lessons.length * 30} mins',
                );
              }),
            ),
        ],
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      builder: (context) => CourseFilterDialog(),
    );
  }
}
