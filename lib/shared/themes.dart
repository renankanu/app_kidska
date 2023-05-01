import 'package:app_kidska/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData theme = ThemeData.light().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.linen,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
  );
}
