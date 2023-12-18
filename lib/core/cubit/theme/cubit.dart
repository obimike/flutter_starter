import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/util/helpers/app_preference.dart';
import 'package:flutter_starter/core/util/helpers/functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeModeEnum { light, dark, system }

class ThemeCubit extends Cubit<ThemeModeEnum> {
  ThemeCubit() : super(ThemeModeEnum.system) {
    _loadThemeMode(); // Load saved theme mode when the Cubit is initialized
  }

  void _loadThemeMode() async {
    print("--------------_loadThemeMode---------------------");
    var savedMode = await AppPreference.getThemeMode();
    emit(
        savedMode == ThemeMode.dark ? ThemeModeEnum.dark : ThemeModeEnum.light);
  }

  void toggleTheme(ThemeModeEnum newMode) {
    emit(newMode);
    ThemeMode themeMode =
        newMode == ThemeModeEnum.dark ? ThemeMode.dark : ThemeMode.light;
    // Saving ThemeMode to local storage
    AppPreference.setThemeMode(themeMode);
  }
}
