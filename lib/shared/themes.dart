import 'package:app_kidska/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData theme = ThemeData.light().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.springWood,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    textTheme: GoogleFonts.comfortaaTextTheme().apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
      fontFamily: GoogleFonts.comfortaa().fontFamily,
    ),
  );
}
