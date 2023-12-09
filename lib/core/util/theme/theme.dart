import 'package:flutter/material.dart';
import 'package:flutter_starter/core/util/constants/colors.dart';
import 'package:flutter_starter/core/util/theme/custom_themes/button_theme.dart';
import 'package:flutter_starter/core/util/theme/custom_themes/input_decoration_theme.dart';
import 'package:flutter_starter/core/util/theme/custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: MyColors.lightBackground,

    textTheme: MyTextTheme.lightTextTheme,
    elevatedButtonTheme: MyButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MyButtonTheme.lightOutlinedButtonTheme,
    textButtonTheme: MyButtonTheme.lightTextButtonTheme,
    inputDecorationTheme: MyInputDecorationTheme.lightInputDecorationTheme,

    // appBarTheme: AppBarTheme(
    //   titleTextStyle: textTheme.titleLarge,
    //   backgroundColor: _background,
    // ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: MyColors.darkBackground,
    // disabledColor: _disabled,

    textTheme: MyTextTheme.darkTextTheme,
    elevatedButtonTheme: MyButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: MyButtonTheme.darkOutlinedButtonTheme,
    textButtonTheme: MyButtonTheme.darkTextButtonTheme,
    inputDecorationTheme: MyInputDecorationTheme.darkInputDecorationTheme,

    // appBarTheme: AppBarTheme(
    //   titleTextStyle: textTheme.titleLarge,
    //   backgroundColor: _background,
    // ),
  );
}
