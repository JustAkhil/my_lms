import 'package:flutter/material.dart';
import 'package:my_lms/view/NavPage/profile/widget/profile_app_bar.dart';
import 'package:my_lms/view/NavPage/profile/widget/profile_option.dart';
import 'package:my_lms/view/NavPage/profile/widget/profile_stats_card.dart';

import '../../../core/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const ProfileAppBar(
            initials: "Orb",
            name: "Akhil Sahu",
            email: "sahuv3694@gmail.com",
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const ProfileStatsCard(),
                  const ProfileOptions()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
