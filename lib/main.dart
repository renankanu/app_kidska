import 'package:app_kidska/routes/app_routes.dart';
import 'package:app_kidska/shared/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'shared/utils/crashlytics_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Future.wait([
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    initCrashlyticsError(),
  ]);

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
