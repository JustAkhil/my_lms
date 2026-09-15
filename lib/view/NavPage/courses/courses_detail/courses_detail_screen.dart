import 'package:flutter/material.dart';
import 'package:my_lms/view/NavPage/courses/courses_detail/widget/course_detail_app_bar.dart';
import 'package:my_lms/view/NavPage/courses/courses_detail/widget/course_info_card.dart';
import 'package:my_lms/view/NavPage/courses/courses_detail/widget/video_lesson_list.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../service/dummy_data/dummy_data_service.dart';

class CoursesDetailScreen extends StatefulWidget {
  final String courseId;

  const CoursesDetailScreen({super.key, required this.courseId});

  @override
  State<CoursesDetailScreen> createState() => _CoursesDetailScreenState();
}

class _CoursesDetailScreenState extends State<CoursesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final id = widget.courseId;
    final course = DummyDataService.getCourseById(id);
    final isCourseCompleted = DummyDataService.isCourseCompleted(id);
    final isUnlock = DummyDataService.isCourseUnlocked(widget.courseId);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CourseDetailAppBar(imgUrl: course.imgUrl),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        course.rating.toString(),
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "(${course.reviewCount} reviews)",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "\$${course.price}",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(course.desc, style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 16),
                  CourseInfoCard(courseModel: course),
                  const SizedBox(height: 24),
                  Text(
                    'Course Content',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  VideoLessonList(
                    courseId: widget.courseId,
                    isUnlocked: isUnlock,
                    onLessonCompleted: () {
                      setState(() {
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
