import 'package:app_kidska/routes/app_routes.dart';
import 'package:app_kidska/shared/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'KIDSKA',
      routerConfig: AppRoutes.router,
      theme: AppTheme.theme,
    );
  }
}
