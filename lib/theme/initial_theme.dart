import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin InitialTheme {
  static Future<ThemeMode> AppThemes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedTheme = prefs.getString('theme');
    switch (savedTheme) {
      case "light":
        return ThemeMode.light;
      case "dark":
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  static Future<SharedPreferences> initialDataTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }
}
