class CourseListArguments {
  final String? categoryId;
  final String? categoryName;
  final bool showBackButton;

  CourseListArguments({
    this.categoryId,
    this.categoryName,
    this.showBackButton = false,
  });
}