import 'package:flutter/material.dart';
import 'package:flutter_starter/core/util/constants/colors.dart';

class MyInputDecorationTheme {
  MyInputDecorationTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
    filled: false,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide.none,
    ),
        focusColor: MyColors.primary,
  );

  static InputDecorationTheme darkInputDecorationTheme =
  const InputDecorationTheme(
    filled: false,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide.none,
    ),
    focusColor: MyColors.primary,
  );
}

// inputDecorationTheme: InputDecorationTheme(
// filled: true,
// floatingLabelBehavior: FloatingLabelBehavior.auto,
// contentPadding: const EdgeInsets.symmetric(
// horizontal: 24,
// vertical: 16,
// ),
// border: const OutlineInputBorder(
// borderRadius: BorderRadius.all(Radius.circular(4)),
// borderSide: BorderSide.none,
// ),
// hintStyle: textTheme.bodyLarge,
// labelStyle: textTheme.bodyLarge!.copyWith(
// color: _secondaryTextColorLight,
// fontWeight: FontWeight.normal,
// ),
// ),
