import 'package:flutter/material.dart';
import 'package:validation_form/utils/constants.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      primary: ColorConst.primaryColor,
      secondary: ColorConst.iconBackgroundActiveColor,
      tertiary: ColorConst.textFieldColor,
      seedColor: ColorConst.iconBackgroundActiveColor,
      surface: ColorConst.colorBackground,
      primaryContainer: ColorConst.whiteColor,
      secondaryContainer: ColorConst.iconBackgroundActiveColor,
      onSurface: ColorConst.disabledButtonColor,
    ),
    scaffoldBackgroundColor: ColorConst.colorBackground,
    fontFamily: 'SF Pro Text',
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: ColorConst.textFieldColor,
      ),
      filled: true,
      fillColor: ColorConst.whiteColor,
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide.none,
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide.none,
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide.none,
      ),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide.none,
      ),
      errorStyle: TextStyle(
          fontSize: 12,
          color: ColorConst.errorColor,
          fontWeight: FontWeight.w400),
      contentPadding: EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 8),
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
          fontSize: 16,
          color: ColorConst.primaryColor,
          fontWeight: FontWeight.w400),
      titleLarge: TextStyle(
        color: ColorConst.primaryColor,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        color: ColorConst.primaryColor,
        fontWeight: FontWeight.w400,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: ColorConst.iconBackgroundActiveColor,
        foregroundColor: ColorConst.whiteColor,
        disabledBackgroundColor: ColorConst.disabledButtonColor,
        disabledForegroundColor: ColorConst.colorBackground,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadowColor: ColorConst.errorColor.withOpacity(.24),
      ),
    ),
    datePickerTheme: const DatePickerThemeData(
      headerBackgroundColor: ColorConst.iconBackgroundActiveColor,
      backgroundColor: ColorConst.whiteColor,
    ),
  );
}
