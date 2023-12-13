import 'package:flutter/material.dart';

class MyFunctions {
  MyFunctions._();

  static bool isDark(BuildContext context) {
    Brightness currentBrightness = Theme.of(context).brightness;
    if (currentBrightness == Brightness.dark) {
      return true;
    } else {
      return false;
    }
  }
}
