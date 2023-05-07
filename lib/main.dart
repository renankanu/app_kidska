import 'package:app_kidska/routes/app_routes.dart';
import 'package:app_kidska/shared/themes.dart';
import 'package:app_kidska/shared/utils/init_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/stories_controller.dart';

void main() async {
  await InitConfig.all();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StoriesController()),
      ],
      child: const MyApp(),
    ),
  );
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
