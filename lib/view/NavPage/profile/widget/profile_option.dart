import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:my_lms/core/utils/app_dialogs.dart';
import 'package:my_lms/routes/app_routes.dart';
import 'package:my_lms/view/NavPage/profile/widget/profile_option_card.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileOptionCard(
          title: "Edit Profile",
          subtitle: "Update your profile information",
          icon: Icons.person,
          onTap: () {},
        ),
        ProfileOptionCard(
          title: "Notifications",
          subtitle: "Manage your notifications",
          icon: Icons.notifications,
          onTap: () {},
        ),
        ProfileOptionCard(
          title: "Settings",
          subtitle: "App preferences and more",
          icon: Icons.settings,
          onTap: () {},
        ),
        ProfileOptionCard(
          title: "Help & Support",
          subtitle: "Get help and support",
          icon: Icons.help_outline,
          onTap: () {},
        ),
        ProfileOptionCard(
          title: "Logout",
          subtitle: "Sign out of your account",
          icon: Icons.logout,
          onTap: () async {
            final confirm = await AppDialogs.showLogoutDialog(context);
            if (confirm==true) {
              Get.offAllNamed(AppRoutes.login);
            }
          },
          isDestructive: true,
        ),
      ],
    );
  }
}
