import 'package:flutter/material.dart';
import 'package:flutter_starter/core/util/constants/colors.dart';
import 'package:flutter_starter/core/util/theme/custom_themes/text_theme.dart';

class MyButtonTheme {
  MyButtonTheme._();

  static final _buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
  );
  static const _buttonPadding = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 12,
  );
  // final buttonTextStyle = textTheme.titleMedium;

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: _buttonShape,
      padding: _buttonPadding,
      backgroundColor: MyColors.primary,
      foregroundColor: MyColors.primaryTextColorDark,
      textStyle: MyTextTheme.lightTextTheme.bodyLarge,
      elevation: 2,
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: _buttonShape,
      padding: _buttonPadding,
      backgroundColor: MyColors.primary,
      foregroundColor: MyColors.primaryTextColorDark,
      textStyle: MyTextTheme.darkTextTheme.bodyLarge,
      elevation: 2,
    ),
  );

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: _buttonShape,
      padding: _buttonPadding,
      side: const BorderSide(
        color: MyColors.primary,
        width: 1,
      ),
      foregroundColor: MyColors.primary,
      textStyle: MyTextTheme.darkTextTheme.bodyLarge,
      elevation: 2,
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: _buttonShape,
      padding: _buttonPadding,
      side: const BorderSide(
        color: MyColors.primary,
        width: 1,
      ),
      foregroundColor: MyColors.primary,
      textStyle: MyTextTheme.darkTextTheme.bodyLarge,
      elevation: 2,
    ),
  );

  static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: _buttonShape,
      padding: _buttonPadding,
      foregroundColor: MyColors.primary,
      textStyle: MyTextTheme.darkTextTheme.bodyLarge,
    ),
  );

  static final darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: _buttonShape,
      padding: _buttonPadding,
      foregroundColor: MyColors.primary,
      textStyle: MyTextTheme.darkTextTheme.bodyLarge,
    ),
  );
}
