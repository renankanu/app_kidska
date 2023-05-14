import 'package:app_kidska/app/shared/themes.dart';
import 'package:app_kidska/app/shared/utils/init_config.dart';
import 'package:app_kidska/core_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await InitConfig.all();
  MobileAds.instance.initialize();
  MobileAds.instance.updateRequestConfiguration(
    RequestConfiguration(
      tagForChildDirectedTreatment: TagForChildDirectedTreatment.yes,
      testDeviceIds: <String>['8E3C21A44E901A4E93D205685909ACA8'],
    ),
  );

  runApp(
    GetMaterialApp(
      title: 'KIDSKA',
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      initialBinding: CoreBinding(),
    ),
  );
}
