import 'package:flutter/material.dart';
import 'package:my_lms/models/category_model.dart';
import 'package:my_lms/service/dummy_data/dummy_data_service.dart';
import 'package:my_lms/view/home/widgets/category.dart';
import 'package:my_lms/view/home/widgets/home_app_bar.dart';
import 'package:my_lms/view/home/widgets/inprogress_section.dart';
import 'package:my_lms/view/home/widgets/recommended_section.dart';
import 'package:my_lms/view/home/widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  final List<CategoryModel> categories = [
    CategoryModel(
      id: "1",
      name: "Coding",
      icon: Icons.code,
      courseCount: DummyDataService.getCoursesByCategory('1').length,
    ),
    CategoryModel(
      id: "2",
      name: "Design",
      icon: Icons.brush,
      courseCount: DummyDataService.getCoursesByCategory('2').length,
    ),
    CategoryModel(
      id: "3",
      name: "Business",
      icon: Icons.business_center,
      courseCount: DummyDataService.getCoursesByCategory('3').length,
    ),
    CategoryModel(
      id: "4",
      name: "Music",
      icon: Icons.music_note,
      courseCount: DummyDataService.getCoursesByCategory('4').length,
    ),
    CategoryModel(
      id: "5",
      name: "Photography",
      icon: Icons.camera,
      courseCount: DummyDataService.getCoursesByCategory('5').length,
    ),
    CategoryModel(
      id: "6",
      name: "Music",
      icon: Icons.language,
      courseCount: DummyDataService.getCoursesByCategory('6').length,
    ),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        HomeAppBar(),
        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const SearchBarWidget(),
              const SizedBox(height: 32),
              CategorySection(categories: categories),
              const SizedBox(height: 32),
              const InProgressSection(),
              const RecommendedSection()
            ]),
          ),
        ),
      ],
    );
  }
}
