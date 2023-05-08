import 'package:app_kidska/app/shared/themes.dart';
import 'package:app_kidska/app/shared/utils/init_config.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await InitConfig.all();

  runApp(GetMaterialApp(
    title: 'KIDSKA',
    initialRoute: AppPages.initial,
    getPages: AppPages.routes,
    theme: AppTheme.theme,
  ));
}
