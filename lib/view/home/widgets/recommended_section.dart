import 'package:flutter/material.dart';
import 'package:my_lms/view/home/widgets/recommendation_course_card.dart';

import '../../../core/theme/app_colors.dart';
import '../../../service/dummy_data/dummy_data_service.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final courses = DummyDataService.courses;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recommended",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(onPressed: () {}, child: Text("See All")),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              return RecommendedCourseCard(
                title: course.title,
                courseId: course.id,
                desc: course.desc,
                instructorId: course.instructorId,
                imgUrl: course.imgUrl,
                isPremium: course.isPremium,
                duration: "${course.lessons.length.toInt() * 30} mins",
              );
            },
          ),
        ),
      ],
    );
  }
}
