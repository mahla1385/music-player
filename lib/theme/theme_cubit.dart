import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'initial_theme.dart';

sealed class ThemeEvent {}

final class ToggleThemeEvent extends ThemeEvent {}

final class InitialThemeEvent extends ThemeEvent {}

class BlocTheme extends Cubit<ThemeMode> {
  BlocTheme() : super(ThemeMode.system) {
    _getInitialTheme.call();
  }

  void _getInitialTheme() async {
    ThemeMode initialTheme = await InitialTheme.AppThemes();
    emit(initialTheme);
  }

  Future<void> changeTheme(String theme) async {
    SharedPreferences prefs = await InitialTheme.initialDataTheme();
    prefs.setString('theme', theme);
    ThemeMode currentTheme = await InitialTheme.AppThemes();
    emit(currentTheme);
  }

  Future<void> autoChange() async {
    SharedPreferences prefs = await InitialTheme.initialDataTheme();
    String themes = "";
    switch(prefs.getString('theme')) {
      case 'light': themes = 'dark'; break;
      case 'dark': themes = 'light'; break;
      // case '': themes = 'light'; break;
    }
    prefs.setString('theme', themes);
    ThemeMode currentTheme = await InitialTheme.AppThemes();
    emit(currentTheme);
  }

}
