import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/theme/app_text_style.dart';

import 'app_color.dart';

abstract class AppTheme {
  static ThemeData lightMode = ThemeData(
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        iconTheme: IconThemeData(color: AppColors.grey900),
        elevation: 0),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.white,
      unselectedLabelStyle: GoogleFonts.urbanist(fontWeight: FontWeight.w500),
      selectedLabelStyle: GoogleFonts.urbanist(fontWeight: FontWeight.w700),
    ),
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    textTheme: AppTextStyle.appTextTheme,
  );

  static ThemeData darkMode = ThemeData(
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.dark1,
      iconTheme: IconThemeData(color: AppColors.white),
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: const Color(0xff181A20).withOpacity(0.8),
      unselectedLabelStyle: GoogleFonts.urbanist(fontWeight: FontWeight.w500),
      selectedLabelStyle: GoogleFonts.urbanist(fontWeight: FontWeight.w700),
    ),
    scaffoldBackgroundColor: AppColors.dark1,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    textTheme: AppTextStyle.appTextTheme,
  );
}
