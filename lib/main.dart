import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_lms/bloc/font/font_bloc.dart';
import 'package:my_lms/bloc/font/font_state.dart';
import 'package:my_lms/core/theme/app_theme.dart';
import 'package:my_lms/routes/app_routes.dart';
import 'package:my_lms/routes/routes_pages.dart';
import 'package:my_lms/service/storage_service.dart';

import 'bloc/auth/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FontBloc(getStorage: GetStorage())),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: BlocBuilder<FontBloc, FontState>(
        builder: (context, fontState) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "E-Learning",
            theme: AppTheme.getLightTheme(fontState),
            themeMode: ThemeMode.light,
            initialRoute: AppRoutes.splash,
            onGenerateRoute: AppRoutes.onGenerateRoutes,
            getPages: AppPages.pages,
          );
        },
      ),
    );
  }
}
