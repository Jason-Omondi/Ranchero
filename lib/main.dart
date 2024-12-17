import 'package:get/get.dart';
import 'core/routes/app_routes.dart';
import 'core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'core/utils/initial_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ess App',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      initialBinding: InitialBindings(),
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.splash,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
