import 'package:flutter/material.dart';
import 'package:my_lms/models/course_model.dart';

import '../../../../../core/theme/app_colors.dart';

class CourseInfoCard extends StatelessWidget {
  final CourseModel courseModel;

  const CourseInfoCard({super.key, required this.courseModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoItem(
                  context: context,
                  iconData: Icons.people,
                  value: "${courseModel.enrollmentCount}+",
                  label: "Students",
                ),
                _buildInfoItem(
                  context: context,
                  iconData: Icons.star,
                  value: "${courseModel.rating}",
                  label: "${courseModel.reviewCount} Reviews",
                ),
                _buildInfoItem(
                  context: context,
                  iconData: Icons.library_books,
                  value: "${courseModel.lessons.length}",
                  label: "Lessons",
                ),
                _buildInfoItem(
                  context: context,
                  iconData: Icons.signal_cellular_alt,
                  value: "Level",
                  label: courseModel.level,
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (courseModel.requirements.isNotEmpty) ...[
              _buildSectionTitle(context, "Requirements"),
              const SizedBox(height: 8),
              ...courseModel.requirements.map(
                (requirement) => _buildRequirementItem(context, requirement),
              ),
              const SizedBox(height: 16),
              if (courseModel.whatYouWillLearned.isNotEmpty) ...[
                _buildSectionTitle(context, "What you will learn"),
                const SizedBox(height: 8),
                ...courseModel.whatYouWillLearned.map(
                  (item) => _buildLearningItem(context, item),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required String value,
    required BuildContext context,
    required IconData iconData,
    required String label,
  }) {
    return Column(
      children: [
        Icon(iconData, color: AppColors.primary),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppColors.secondary),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildRequirementItem(BuildContext context, String requirement) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "• ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          Expanded(child: Text(requirement, style: theme.textTheme.bodyMedium)),
        ],
      ),
    );
  }

  Widget _buildLearningItem(BuildContext context, String item) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: AppColors.primary, size: 16),
          const SizedBox(width: 8),
          Expanded(child: Text(item, style: theme.textTheme.bodyMedium)),

        ],
      ),
    );
  }
}
