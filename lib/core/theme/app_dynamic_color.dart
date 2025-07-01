import 'package:flutter/material.dart';

import 'app_color.dart';

abstract class AppDynamicColorBuilder {
  static bool isDarkMode = false;

  static Color getGrey900AndWhite(BuildContext context) =>
      isDarkMode ? AppColors.white : AppColors.grey900;

  static Color getGrey800AndWhite(BuildContext context) =>
      isDarkMode ? AppColors.white : AppColors.grey800;

  static Color getGrey800AndGrey300(BuildContext context) =>
      isDarkMode ? AppColors.grey300 : AppColors.grey800;

  static Color getGrey700AndGrey300(BuildContext context) =>
      isDarkMode ? AppColors.grey300 : AppColors.grey700;

  static Color getGrey100AndDark2(BuildContext context) {
    return isDarkMode ? AppColors.dark2 : AppColors.grey100;
  }

  static Color getGrey600AndGrey400(BuildContext context) =>
      isDarkMode ? AppColors.grey600 : AppColors.grey400;

  static Color getWhiteAndDark2(BuildContext context) =>
      isDarkMode ? AppColors.dark2 : AppColors.white;

  static Color getPrimary100AndDark3(BuildContext context) =>
      isDarkMode ? AppColors.dark3 : AppColors.primary.withOpacity(0.2);

  static Color getPrimaryAndWhite(BuildContext context) =>
      isDarkMode ? AppColors.white : AppColors.primary;

  static Color getDark3AndGrey200(BuildContext context) =>
      isDarkMode ? AppColors.dark3 : AppColors.grey200;

  static Color getDark2AndGrey50(BuildContext context) =>
      isDarkMode ? AppColors.dark2 : AppColors.grey50;
}
