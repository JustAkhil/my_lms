import 'package:flutter/material.dart';

import '../../../../../service/dummy_data/dummy_data_service.dart';
import 'lesson_tile.dart';

class VideoLessonList extends StatelessWidget {
  final String courseId;
  final bool isUnlocked;
  final VoidCallback onLessonCompleted;

  const VideoLessonList({
    super.key,
    required this.courseId,
    required this.isUnlocked,
    required this.onLessonCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final course = DummyDataService.getCourseById(courseId);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: course.lessons.length,
      itemBuilder: (context, index) {
        final lesson = course.lessons[index];
        final isLocked =
            !lesson.isPreview &&
            (index > 0 &&
                !DummyDataService.isLessonCompleted(
                  courseId,
                  course.lessons[index - 1].id,
                ));
        return LessonTile();
      },
    );
  }
}
