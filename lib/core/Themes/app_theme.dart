import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.white,
    fontFamily: 'Poppins',
    primaryColor: ColorManager.primary,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      foregroundColor: ColorManager.white,
      backgroundColor: ColorManager.primary,
      elevation: 0,
      titleTextStyle: getBoldStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
    ),
  );
}
