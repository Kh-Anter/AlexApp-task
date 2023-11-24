import 'package:alexapp_task/const/strings.dart';
import 'package:flutter/material.dart';

class Themes {
  static const TextStyle orderUserName =
      TextStyle(fontSize: 16, color: AppStrings.titleColor);
  static const TextStyle orderLocation =
      TextStyle(fontSize: 14, color: AppStrings.locationColor);
  static const TextStyle cardButtonTxt =
      TextStyle(fontSize: 16, color: AppStrings.titleColor);
  static const TextStyle screenTitle =
      TextStyle(fontSize: 20, color: AppStrings.titleColor);

  static ThemeData getAppTheme() => ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          // color: Colors.transparent,
          actionsIconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          titleTextStyle:
              TextStyle(fontSize: 24, color: AppStrings.titleColor)));
}
