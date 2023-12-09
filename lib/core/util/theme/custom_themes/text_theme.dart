import 'package:flutter/material.dart';
import 'package:flutter_starter/core/util/constants/colors.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sizer/sizer.dart';

class MyTextTheme {
  MyTextTheme._();

  static const _headlineColorLight = MyColors.primaryTextColorLight;
  static const _headlineColorDark = MyColors.primaryTextColorDark;
  static const _headlineWeight = FontWeight.w700;
  static const _headlineHeight = 1.2;

  static const _titleColorLight = MyColors.primaryTextColorLight;
  static const _titleColorDark = MyColors.primaryTextColorDark;
  static const _titleWeight = FontWeight.normal;
  static const _titleHeight = 1.2;
  static const _titleLetterSpacing = -0.96;

  static const _bodyColorLight = MyColors.primaryTextColorLight;
  static const _bodyColorDark = MyColors.primaryTextColorDark;
  static const _bodyWeight = FontWeight.normal;
  static const _bodyHeight = 1.5;
  static const _bodyLetterSpacing = 0.0;

  static const _labelColor = MyColors.secondaryTextColorLight;

  static TextTheme lightTextTheme = TextTheme(
    // Headline
    headlineLarge: const TextStyle().copyWith(
      fontSize: 30.sp,
      height: _headlineHeight,
      color: _headlineColorLight,
    ),

    // Body
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.sp,
      height: _bodyHeight,
      letterSpacing: _bodyLetterSpacing,
      color: _bodyColorLight,
      fontWeight: _bodyWeight,
    ),

    bodyMedium: const TextStyle().copyWith(
      fontSize: 12.sp,
      height: _bodyHeight,
      letterSpacing: _bodyLetterSpacing,
      color: _bodyColorLight,
      fontWeight: _bodyWeight,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 10.sp,
      height: _bodyHeight,
      color: _bodyColorLight,
      fontWeight: _bodyWeight,
    ),


// Title
    titleLarge: const TextStyle().copyWith(
      fontSize: 24.sp,
      height: _titleHeight,
      letterSpacing: _titleLetterSpacing,
      color: _titleColorLight,
      fontWeight: _titleWeight,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 20.sp,
      height: _titleHeight,
      letterSpacing: _titleLetterSpacing,
      color: _titleColorLight,
      fontWeight: _titleWeight,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16.sp,
      height: _titleHeight,
      letterSpacing: _titleLetterSpacing,
      color: _titleColorLight,
      fontWeight: _titleWeight,
    ),


    // Label
    labelLarge:  const TextStyle().copyWith(
      fontSize: 12.sp,
      height: _bodyHeight,
      letterSpacing: _bodyLetterSpacing,
      color: _labelColor,
      fontWeight: _bodyWeight,
    ),
    labelMedium:  const TextStyle().copyWith(
      fontSize: 10.sp,
      height: _bodyHeight,
      letterSpacing: _bodyLetterSpacing,
      color: _labelColor,
      fontWeight: _bodyWeight,
    ),
    labelSmall:  const TextStyle().copyWith(
      fontSize: 8.sp,
      height: _bodyHeight,
      letterSpacing: _bodyLetterSpacing,
      color: _labelColor,
      fontWeight: _bodyWeight,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    // Headline
    headlineLarge: const TextStyle().copyWith(
      fontSize: 30.sp,
      height: _headlineHeight,
      color: _headlineColorDark,
    ),

    // Body
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.sp,
      height: _bodyHeight,
      letterSpacing: _bodyLetterSpacing,
      color: _bodyColorDark,
      fontWeight: _bodyWeight,
    ),

    bodyMedium: const TextStyle().copyWith(
      fontSize: 12.sp,
      height: _bodyHeight,
      letterSpacing: _bodyLetterSpacing,
      color: _bodyColorDark,
      fontWeight: _bodyWeight,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 10.sp,
      height: _bodyHeight,
      color: _bodyColorDark,
      fontWeight: _bodyWeight,
    ),


// Title
    titleLarge: const TextStyle().copyWith(
      fontSize: 24.sp,
      height: _titleHeight,
      letterSpacing: _titleLetterSpacing,
      color: _titleColorDark,
      fontWeight: _titleWeight,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 20.sp,
      height: _titleHeight,
      letterSpacing: _titleLetterSpacing,
      color: _titleColorDark,
      fontWeight: _titleWeight,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 16.sp,
      height: _titleHeight,
      letterSpacing: _titleLetterSpacing,
      color: _titleColorDark,
      fontWeight: _titleWeight,
    ),


    // Label
    labelLarge:  const TextStyle().copyWith(
      fontSize: 12.sp,
      height: _bodyHeight,
      letterSpacing: _bodyLetterSpacing,
      color: _labelColor,
      fontWeight: _bodyWeight,
    ),
    labelMedium:  const TextStyle().copyWith(
      fontSize: 10.sp,
      height: _bodyHeight,
      letterSpacing: _bodyLetterSpacing,
      color: _labelColor,
      fontWeight: _bodyWeight,
    ),
    labelSmall:  const TextStyle().copyWith(
      fontSize: 8.sp,
      height: _bodyHeight,
      letterSpacing: _bodyLetterSpacing,
      color: _labelColor,
      fontWeight: _bodyWeight,
    ),
  );

}
