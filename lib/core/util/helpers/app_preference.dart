import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {

  // static const themeMode = "themeMode";
  //
  // setThemePref(bool value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool(themeMode, value);
  // }
  //
  // Future<bool> getTheme() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool(themeMode) ?? false;
  // }


  static const String themeModeKey = 'themeMode';

  // Function to save the selected theme mode
  static Future<void> setThemeMode(ThemeMode themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(themeModeKey, themeMode.index);
  }

  // Function to load the saved theme mode
  static Future<ThemeMode> getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int themeModeIndex = prefs.getInt(themeModeKey) ?? ThemeMode.system.index;
    return ThemeMode.values[themeModeIndex];
  }

}