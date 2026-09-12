import 'package:flutter/material.dart';
import 'package:my_lms/models/category_model.dart';
import 'package:my_lms/models/chat_model.dart';
import 'package:my_lms/models/course_model.dart';
import 'package:my_lms/models/lessons_model.dart';
import 'package:my_lms/models/question_model.dart';
import 'package:my_lms/models/quiz_attempt.dart';
import 'package:my_lms/models/quiz_model.dart';

class DummyDataService {
  static final List<CategoryModel> categories = [
    const CategoryModel(
      id: '1',
      name: 'Coding',
      icon: Icons.code,
      courseCount: 2,
    ),
    const CategoryModel(
      id: '2',
      name: 'Design',
      icon: Icons.palette_outlined,
      courseCount: 2,
    ),
    const CategoryModel(
      id: '3',
      name: 'Business',
      icon: Icons.business_center_outlined,
      courseCount: 2,
    ),
    const CategoryModel(
      id: '4',
      name: 'Marketing',
      icon: Icons.campaign_outlined,
      courseCount: 1,
    ),
    const CategoryModel(
      id: '5',
      name: 'Photography',
      icon: Icons.camera_alt_outlined,
      courseCount: 1,
    ),
    const CategoryModel(
      id: '6',
      name: 'Language',
      icon: Icons.language,
      courseCount: 1,
    ),
  ];

  static final List<CourseModel> courses = [
    CourseModel(
      id: '1',
      title: 'Flutter Development Bootcamp',
      desc:
          'Master Flutter and Dart from scratch. Build real-world cross-platform apps.',
      imgUrl: 'https://i.ytimg.com/vi/z9kOcyktS8s/maxresdefault.jpg',
      instructorId: 'inst_1',
      categoryId: '1', // Programming / Coding
      price: 99.99,
      lessons: _createFlutterLessons(),
      level: 'Intermediate',
      requirements: const [
        'Basic programming knowledge',
        'Computer with internet connection',
        'Dedication to learn',
      ],
      whatYouWillLearned: const [
        'Build beautiful native apps',
        'Master Dart programming',
        'State management with GetX',
        'REST API integration',
        'Local data storage',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      updatedAt: DateTime.now(),
      rating: 4.8,
      reviewCount: 245,
      enrollmentCount: 1200,
      isPremium: false,
    ),
    CourseModel(
      id: '2',
      title: 'UI/UX Design Masterclass',
      desc:
          'Learn professional UI/UX design from scratch using Figma and Adobe XD.',
      imgUrl:
          'https://img.freepik.com/premium-psd/school-education-admission-youtube-thumbnail-web-banner-template_566708-410.jpg',
      instructorId: 'inst_2',
      categoryId: '2', // Design
      price: 79.99,
      lessons: _createDesignLessons(),
      level: 'Beginner',
      requirements: const [
        'Computer with internet',
        'Figma account',
        'Basic design sense',
      ],
      whatYouWillLearned: const [
        'Figma fundamentals',
        'Design systems',
        'Prototyping',
        'User research',
        'Mobile app design',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
      updatedAt: DateTime.now(),
      rating: 4.6,
      reviewCount: 189,
      enrollmentCount: 890,
      isPremium: true,
    ),
    CourseModel(
      id: '3',
      title: 'Digital Marketing Essentials',
      desc: 'Master digital marketing strategies for business growth.',
      imgUrl:
          'https://img.freepik.com/free-vector/online-english-lessons-youtube-thumbnail_23-2149291958.jpg',
      instructorId: 'inst_3',
      categoryId: '3', // Business / Marketing
      price: 89.99,
      lessons: _createMarketingLessons(),
      level: 'Intermediate',
      requirements: const [
        'Basic marketing knowledge',
        'Social media familiarity',
        'Google Analytics account',
      ],
      whatYouWillLearned: const [
        'Digital marketing fundamentals',
        'SEO optimization',
        'Social media marketing',
        'Email marketing campaigns',
        'Analytics and conversion tracking',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
      updatedAt: DateTime.now(),
      rating: 4.7,
      reviewCount: 156,
      enrollmentCount: 750,
      isPremium: true,
    ),
    CourseModel(
      id: '4',
      title: 'Advanced Mobile App Architecture',
      desc:
          'Learn advanced architectural patterns and best practices for mobile app development.',
      imgUrl:
          'https://img.freepik.com/free-vector/gradient-ui-ux-background_23-2149024129.jpg',
      instructorId: 'inst_4',
      categoryId: '1', // Coding
      price: 129.99,
      lessons: _createArchitectureLessons(),
      level: 'Advanced',
      requirements: const [
        'Intermediate programming knowledge',
        'Basic mobile development experience',
        'Understanding of design patterns',
      ],
      whatYouWillLearned: const [
        'Clean Architecture principles',
        'SOLID principles in mobile development',
        'State management patterns',
        'Dependency injection',
        'Testing strategies',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 60)),
      updatedAt: DateTime.now(),
      rating: 4.9,
      reviewCount: 112,
      enrollmentCount: 560,
      isPremium: true,
    ),
    CourseModel(
      id: '5',
      title: 'Motion Design with After Effects',
      desc:
          'Create stunning motion graphics and visual effects using Adobe After Effects.',
      imgUrl:
          'https://img.freepik.com/free-vector/flat-design-motion-graphics-background_23-2149489315.jpg',
      instructorId: 'inst_5',
      categoryId: '2', // Design
      price: 89.99,
      lessons: _createMotionDesignLessons(),
      level: 'Intermediate',
      requirements: const [
        'Basic Adobe After Effects knowledge',
        'Understanding of design principles',
        'Creative mindset',
      ],
      whatYouWillLearned: const [
        'Advanced animation techniques',
        'Character animation',
        'Visual effects creation',
        'Motion graphics principles',
        'Project workflow optimization',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 15)),
      updatedAt: DateTime.now(),
      rating: 4.7,
      reviewCount: 145,
      enrollmentCount: 420,
      isPremium: true,
    ),
    CourseModel(
      id: '6',
      title: 'Financial Management Fundamentals',
      desc:
          'Master the basics of financial management and business economics.',
      imgUrl:
          'https://img.freepik.com/free-vector/gradient-stock-market-concept_23-2149166910.jpg',
      instructorId: 'inst_6',
      categoryId: '3', // Business
      price: 74.99,
      lessons: _createFinanceLessons(),
      level: 'Beginner',
      requirements: const [
        'Basic math skills',
        'Interest in finance',
        'No prior experience needed',
      ],
      whatYouWillLearned: const [
        'Financial statements analysis',
        'Investment basics',
        'Risk management',
        'Budgeting and forecasting',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 25)),
      updatedAt: DateTime.now(),
      rating: 4.6,
      reviewCount: 98,
      enrollmentCount: 340,
      isPremium: false,
    ),
    CourseModel(
      id: '7',
      title: 'Professional Photography Masterclass',
      desc:
          'Learn professional photography techniques from composition to post-processing.',
      imgUrl:
          'https://img.freepik.com/free-photo/professional-camera-blurred-background_169016-10249.jpg',
      instructorId: 'inst_7',
      categoryId: '5', // Photography
      price: 84.99,
      lessons: _createPhotographyLessons(),
      level: 'Beginner',
      requirements: const [
        'Digital camera (DSLR or Mirrorless)',
        'Basic computer skills',
        'Adobe Lightroom (optional)',
      ],
      whatYouWillLearned: const [
        'Camera basics and settings',
        'Lighting techniques',
        'Composition rules',
        'Portrait photography',
        'Photo editing in Lightroom',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 25)),
      updatedAt: DateTime.now(),
      rating: 4.7,
      reviewCount: 132,
      enrollmentCount: 450,
      isPremium: true,
    ),
    CourseModel(
      id: '8',
      title: 'English Business Communication',
      desc: 'Master business English for professional success.',
      imgUrl:
          'https://img.freepik.com/free-vector/language-learning-concept-illustration_114360-6565.jpg',
      instructorId: 'inst_8',
      categoryId: '6', // Language
      price: 69.99,
      lessons: _createLanguageLessons(),
      level: 'Intermediate',
      requirements: const [
        'Basic English knowledge',
        'Dedication to practice',
        'Internet connection',
      ],
      whatYouWillLearned: const [
        'Email writing',
        'Presentation skills',
        'Negotiation techniques',
        'Professional communication',
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
      updatedAt: DateTime.now(),
      rating: 4.8,
      reviewCount: 167,
      enrollmentCount: 580,
      isPremium: true,
    ),
  ];

  static final List<QuizModel> quizzes = [
    QuizModel(
      id: '1',
      title: 'Flutter Basics Quiz',
      desc: 'Test your knowledge of Flutter fundamentals',
      timeLimit: 30,
      questions: _createFlutterQuizQuestions(),
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      isActive: true,
    ),
    QuizModel(
      id: '2',
      title: 'Dart Programming Quiz',
      desc: 'Check your understanding of Dart programming concepts',
      timeLimit: 25,
      questions: _createDartQuizQuestions(),
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      isActive: true,
    ),
    QuizModel(
      id: '3',
      title: 'State Management Quiz',
      desc: 'Test your knowledge of Flutter state management',
      timeLimit: 20,
      questions: _createStateManagementQuizQuestions(),
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      isActive: true,
    ),
  ];

  static final List<QuizAttempt> quizAttempts = [];
  static List<LessonsModel> _createFlutterLessons() {
    return [
      LessonsModel(
        id: '1',
        title: 'Introduction to Flutter',
        desc: 'This is a detailed description for Introduction to Flutter',
        videoUrl:
            'https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
        duration: 30,
        resources: _createDummyResources(),
        isPreview: true,
        isLocked: false,
        isCompleted: true,
      ),
      _createLesson('2', 'Dart Programming Basics', false, false),
      _createLesson('3', 'Building UI with Widgets', false, false),
      _createLesson('4', 'State Management', false, false),
      _createLesson('5', 'Working with APIs', false, false),
      _createLesson('6', 'Local Data Storage', false, false),
    ];
  }

  static List<LessonsModel> _createDesignLessons() {
    return [
      _createLesson('1', 'Design Fundamentals', true, false),
      _createLesson('2', 'Color Theory', false, false),
      _createLesson('3', 'Typography Basics', false, false),
      _createLesson('4', 'Layout Design', false, false),
      _createLesson('5', 'Prototyping', false, false),
    ];
  }

  static List<LessonsModel> _createMarketingLessons() {
    return [
      _createLesson('1', 'Digital Marketing Overview', true, true),
      _createLesson('2', 'SEO Fundamentals', false, false),
      _createLesson('3', 'Social Media Strategy', false, false),
      _createLesson('4', 'Email Marketing', false, false),
      _createLesson('5', 'Analytics & Reporting', false, false),
    ];
  }

  static List<LessonsModel> _createArchitectureLessons() {
    return [
      _createLesson('1', 'Clean Architecture Overview', true, true),
      _createLesson('2', 'SOLID Principles', false, true),
      _createLesson('3', 'Repository Pattern', false, true),
      _createLesson('4', 'Dependency Injection', false, false),
      _createLesson('5', 'Unit Testing', false, false),
    ];
  }

  static List<LessonsModel> _createMotionDesignLessons() {
    return [
      _createLesson('1', 'Animation Basics', true, false),
      _createLesson('2', 'Keyframe Animation', false, false),
      _createLesson('3', 'Character Rigging', false, false),
      _createLesson('4', 'Visual Effects', false, false),
      _createLesson('5', 'Project Workflow', false, false),
    ];
  }

  static List<LessonsModel> _createFinanceLessons() {
    return [
      _createLesson('1', 'Introduction to Finance', true, false),
      _createLesson('2', 'Financial Statements', false, false),
      _createLesson('3', 'Investment Basics', false, false),
      _createLesson('4', 'Risk Management', false, false),
      _createLesson('5', 'Business Valuation', false, false),
    ];
  }

  static List<LessonsModel> _createPhotographyLessons() {
    return [
      _createLesson('1', 'Understanding Your Camera', true, false),
      _createLesson('2', 'Composition Basics', false, false),
      _createLesson('3', 'Lighting Techniques', false, false),
      _createLesson('4', 'Portrait Photography', false, false),
      _createLesson('5', 'Post-Processing', false, false),
    ];
  }

  static List<LessonsModel> _createLanguageLessons() {
    return [
      _createLesson('1', 'Business Vocabulary', true, false),
      _createLesson('2', 'Email Writing', false, false),
      _createLesson('3', 'Presentations', false, false),
      _createLesson('4', 'Negotiations', false, false),
      _createLesson('5', 'Networking', false, false),
    ];
  }

  static LessonsModel _createLesson(
    String id,
    String title,
    bool isPreview,
    bool isCompleted,
  ) {
    return LessonsModel(
      id: 'lesson_$id',
      title: title,
      desc: 'This is a detailed description for $title',
      videoUrl:
          'https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
      duration: 30,
      resources: _createDummyResources(),
      isPreview: isPreview,
      isLocked: !isPreview,
      isCompleted: isCompleted,
    );
  }

  static List<Resource> _createDummyResources() {
    return const [
      Resource(
        id: 'res_1',
        title: 'Lesson Slides',
        type: 'pdf',
        url: 'https://example.com/slides.pdf',
      ),
    ];
  }

  static CourseModel getCourseById(String id) {
    return courses.firstWhere(
      (course) => course.id == id,
      orElse: () => courses.first,
    );
  }

  static List<CourseModel> getCoursesByCategory(String categoryId) {
    return courses.where((course) => course.categoryId == categoryId).toList();
  }

  static List<CourseModel> getInstructorCourses(String instructorId) {
    return courses
        .where((course) => course.instructorId == instructorId)
        .toList();
  }

  static bool isCourseCompleted(String courseId) {
    final course = getCourseById(courseId);
    return course.lessons.every((lesson) => lesson.isCompleted);
  }

  static List<QuestionModel> _createFlutterQuizQuestions() {
    return [
      QuestionModel(
        id: '1',
        text: 'What is Flutter?',
        options: [
          Option(id: 'a', text: 'A UI framework for building native apps'),
          Option(id: 'b', text: 'A programming language'),
          Option(id: 'c', text: 'A database management system'),
          Option(id: 'd', text: 'A design tool'),
        ],
        correctOptionId: 'a',
        points: 1,
      ),
      QuestionModel(
        id: '2',
        text: 'Which programming language is used in Flutter?',
        options: [
          Option(id: 'a', text: 'Java'),
          Option(id: 'b', text: 'Kotlin'),
          Option(id: 'c', text: 'Dart'),
          Option(id: 'd', text: 'Swift'),
        ],
        correctOptionId: 'c',
        points: 1,
      ),
    ];
  }

  static List<QuestionModel> _createDartQuizQuestions() {
    return [
      QuestionModel(
        id: '1',
        text: 'What is Dart?',
        options: [
          Option(id: 'a', text: 'A markup language'),
          Option(id: 'b', text: 'An object-oriented programming language'),
          Option(id: 'c', text: 'A database'),
          Option(id: 'd', text: 'A web browser'),
        ],
        correctOptionId: 'b',
        points: 1,
      ),
      QuestionModel(
        id: '2',
        text: 'Which keyword is used to declare a constant in Dart?',
        options: [
          Option(id: 'a', text: 'var'),
          Option(id: 'b', text: 'const'),
          Option(id: 'c', text: 'let'),
          Option(id: 'd', text: 'define'),
        ],
        correctOptionId: 'b',
        points: 1,
      ),
    ];
  }

  static List<QuestionModel> _createStateManagementQuizQuestions() {
    return [
      QuestionModel(
        id: '1',
        text: 'What is state management in Flutter?',
        options: [
          Option(id: 'a', text: 'Managing app data and UI updates'),
          Option(id: 'b', text: 'Managing device storage'),
          Option(id: 'c', text: 'Managing user authentication'),
          Option(id: 'd', text: 'Managing network requests'),
        ],
        correctOptionId: 'a',
        points: 1,
      ),
      QuestionModel(
        id: '2',
        text:
            'Which of the following is a built-in state management mechanism in Flutter?',
        options: [
          Option(id: 'a', text: 'InheritedWidget'),
          Option(id: 'b', text: 'Redux'),
          Option(id: 'c', text: 'MobX'),
          Option(id: 'd', text: 'Bloc'),
        ],
        correctOptionId: 'a',
        points: 1,
      ),
    ];
  }

  // ==================== Quiz Methods ====================

  static QuizModel getQuizById(String id) {
    return quizzes.firstWhere(
      (quiz) => quiz.id == id,
      orElse: () => quizzes.first,
    );
  }

  static void saveQuizAttempt(QuizAttempt attempt) {
    quizAttempts.add(attempt);
  }

  static List<QuizAttempt> getQuizAttempts(String userId) {
    return quizAttempts.where((attempt) => attempt.userId == userId).toList();
  }

  // ==================== Purchased Courses ====================

  static final Set<String> _purchasedCourseIds = {};

  static bool isCourseUnlocked(String courseId) {
    final course = getCourseById(courseId);
    return !course.isPremium || _purchasedCourseIds.contains(courseId);
  }

  static void addPurchasedCourse(String courseId) {
    _purchasedCourseIds.add(courseId);
  }

  // ==================== Teacher Stats Dummy Data ====================

  static final Map<String, TeacherStats> teacherStats = {
    'inst_1': TeacherStats(
      totalStudents: 1234,
      activeCourses: 8,
      totalRevenue: 12345.67,
      averageRating: 4.8,
      monthlyEnrollments: const [156, 189, 234, 278, 312, 289],
      monthlyRevenue: const [1234, 1567, 1890, 2100, 2345, 2189],
      studentEngagement: StudentEngagement(
        averageCompletionRate: 0.78,
        averageTimePerLesson: 45,
        activeStudentsThisWeek: 156,
        courseCompletionRates: const {
          'Flutter Development Bootcamp': 0.85,
          'Advanced Flutter': 0.72,
          'Flutter State Management': 0.68,
        },
      ),
    ),
  };

  static final Map<String, List<StudentProgress>> studentProgress = {
    'inst_1': [
      StudentProgress(
        studentId: 'student_1',
        studentName: 'John Smith',
        courseId: '1',
        courseName: 'Flutter Development Bootcamp',
        progress: 0.75,
        lastActive: DateTime.now().subtract(const Duration(hours: 2)),
        quizScores: const [85, 92, 78, 88],
        completedLessons: 12,
        totalLessons: 16,
        averageTimePerLesson: 45,
      ),
      StudentProgress(
        studentId: 'student_2',
        studentName: 'Emma Wilson',
        courseId: '1',
        courseName: 'Flutter Development Bootcamp',
        progress: 0.60,
        lastActive: DateTime.now().subtract(const Duration(days: 1)),
        quizScores: const [75, 80, 85],
        completedLessons: 10,
        totalLessons: 16,
        averageTimePerLesson: 50,
      ),
    ],
  };

  static TeacherStats getTeacherStats(String instructorId) {
    final instructorCourses = getInstructorCourses(instructorId);
    final stats = teacherStats[instructorId] ?? TeacherStats.empty();

    return TeacherStats(
      totalStudents: instructorCourses.fold(
        0,
        (sum, course) => sum + course.enrollmentCount,
      ),
      activeCourses: instructorCourses.length,
      totalRevenue: instructorCourses.fold(
        0.0,
        (sum, course) => sum + (course.price * course.enrollmentCount),
      ),
      averageRating: instructorCourses.isEmpty
          ? 0.0
          : instructorCourses.fold(0.0, (sum, course) => sum + course.rating) /
              instructorCourses.length,
      monthlyEnrollments: stats.monthlyEnrollments,
      monthlyRevenue: stats.monthlyRevenue,
      studentEngagement: stats.studentEngagement,
    );
  }

  static List<StudentProgress> getStudentProgress(String instructorId) {
    final instructorCourses = getInstructorCourses(instructorId);
    final courseIds = instructorCourses.map((c) => c.id).toSet();

    return studentProgress[instructorId]
            ?.where((progress) => courseIds.contains(progress.courseId))
            .toList() ??
        [];
  }

  // ==================== Chat Dummy Data & Methods ====================

  static final Map<String, List<ChatModel>> _dummyChats = {
    'inst_1': [
      ChatModel(
        id: '1',
        senderId: 'student_1',
        receiverId: 'inst_1',
        courseId: '1',
        message: 'Hi, I have a question about state management',
        timeStamp: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      ChatModel(
        id: '2',
        senderId: 'student_2',
        receiverId: 'inst_1',
        courseId: '1',
        message: 'Can you explain InheritedWidget again?',
        timeStamp: DateTime.now().subtract(const Duration(minutes: 15)),
      ),
    ],
  };

  static Stream<List<ChatModel>> getChatMessages(String courseId) {
    return Stream.value(
      _dummyChats.values
          .expand((messages) => messages)
          .where((msg) => msg.courseId == courseId)
          .toList(),
    );
  }

  static Stream<List<ChatModel>> getTeacherChats(String instructorId) {
    return Stream.value(_dummyChats[instructorId] ?? []);
  }

  static Map<String, List<ChatModel>> getTeacherChatsByCourse(
    String instructorId,
  ) {
    final Map<String, List<ChatModel>> chatsByCourse = {};
    final messages = _dummyChats[instructorId] ?? [];

    for (var message in messages) {
      if (!chatsByCourse.containsKey(message.courseId)) {
        chatsByCourse[message.courseId] = [];
      }
      chatsByCourse[message.courseId]!.add(message);
    }

    return chatsByCourse;
  }

  // ==================== Lesson Status ====================

  static void updateLessonStatus(
    String courseId,
    String lessonId, {
    bool? isCompleted,
    bool? isLocked,
  }) {
    final courseIndex = courses.indexWhere((c) => c.id == courseId);
    if (courseIndex == -1) return;
    final course = courses[courseIndex];
    final lessonIndex = course.lessons.indexWhere((l) => l.id == lessonId);
    if (lessonIndex == -1) return;

    var updatedLesson = course.lessons[lessonIndex].copyWith(
      isCompleted: isCompleted ?? course.lessons[lessonIndex].isCompleted,
      isLocked: isLocked ?? course.lessons[lessonIndex].isLocked,
    );

    courses[courseIndex].lessons[lessonIndex] = updatedLesson;
  }

  static bool isLessonCompleted(String courseId, String lessonId) {
    final course = getCourseById(courseId);
    return course.lessons
        .firstWhere(
          (l) => l.id == lessonId,
          orElse: () => const LessonsModel(
            id: '',
            title: '',
            desc: '',
            videoUrl: '',
            duration: 0,
            resources: [],
          ),
        )
        .isCompleted;
  }
}

// ==================== Teacher / Student Supporting Models ====================

class TeacherStats {
  final int totalStudents;
  final int activeCourses;
  final double totalRevenue;
  final double averageRating;
  final List<int> monthlyEnrollments;
  final List<double> monthlyRevenue;
  final StudentEngagement studentEngagement;

  TeacherStats({
    required this.totalStudents,
    required this.activeCourses,
    required this.totalRevenue,
    required this.averageRating,
    required this.monthlyEnrollments,
    required this.monthlyRevenue,
    required this.studentEngagement,
  });

  factory TeacherStats.empty() => TeacherStats(
    totalStudents: 0,
    activeCourses: 0,
    totalRevenue: 0,
    averageRating: 0,
    monthlyEnrollments: [],
    monthlyRevenue: [],
    studentEngagement: StudentEngagement.empty(),
  );
}

class StudentEngagement {
  final double averageCompletionRate;
  final int averageTimePerLesson;
  final int activeStudentsThisWeek;
  final Map<String, double> courseCompletionRates;

  StudentEngagement({
    required this.averageCompletionRate,
    required this.averageTimePerLesson,
    required this.activeStudentsThisWeek,
    required this.courseCompletionRates,
  });

  factory StudentEngagement.empty() => StudentEngagement(
    averageCompletionRate: 0,
    averageTimePerLesson: 0,
    activeStudentsThisWeek: 0,
    courseCompletionRates: {},
  );
}

class StudentProgress {
  final String studentId;
  final String studentName;
  final String courseId;
  final String courseName;
  final double progress;
  final DateTime lastActive;
  final List<int> quizScores;
  final int completedLessons;
  final int totalLessons;
  final int averageTimePerLesson;

  double get averageScore {
    if (quizScores.isEmpty) return 0.0;
    return quizScores.reduce((a, b) => a + b) / quizScores.length / 100;
  }

  StudentProgress({
    required this.studentId,
    required this.studentName,
    required this.courseId,
    required this.courseName,
    required this.progress,
    required this.lastActive,
    required this.quizScores,
    required this.completedLessons,
    required this.totalLessons,
    required this.averageTimePerLesson,
  });
}
