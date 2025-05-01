import 'package:music/theme/theme_cubit.dart';
import 'package:music/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/tools_app.dart';

class AppUi extends StatefulWidget {
  final Widget child;
  final Widget? bottomNavigation;
  final Color? statusBarColor;
  final Color? navigationBarColor;
  final Color? backgroundColor;
  final bool? statusBarDarkIcons;
  final bool? navigationBarDarkIcons;
  final bool? useSafeArea;

  const AppUi({
    super.key,
    required this.child,
    this.useSafeArea = true,
    this.bottomNavigation,
    this.statusBarColor,
    this.navigationBarColor,
    this.statusBarDarkIcons,
    this.backgroundColor,
    this.navigationBarDarkIcons,
  });

  @override
  State<AppUi> createState() => _AppUiState();
}

class _AppUiState extends State<AppUi> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocTheme, ThemeMode>(
      builder: (context, themeState) {
        SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
          statusBarColor: widget.statusBarColor ??
              Colors.transparent,
          statusBarIconBrightness: (widget.statusBarDarkIcons != null)
              ? (widget.statusBarDarkIcons!
              ? Brightness.dark
              : Brightness.light)
              : (Utils.isColorDark(getTheme(context).scaffoldBackgroundColor)
              ? Brightness.light
              : Brightness.dark),
          systemNavigationBarColor: widget.navigationBarColor ??
              getTheme(context).scaffoldBackgroundColor,
          systemNavigationBarIconBrightness:
          (widget.navigationBarDarkIcons != null)
              ? (widget.navigationBarDarkIcons!
              ? Brightness.dark
              : Brightness.light)
              : (themeState == ThemeMode.dark
              ? Brightness.light
              : Brightness.dark),
        );

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: systemUiOverlayStyle,
          child: (widget.useSafeArea == true) ? SafeArea(
            child: Scaffold(
              backgroundColor: widget.backgroundColor ?? getTheme(context).scaffoldBackgroundColor,
              body: widget.child,
              bottomNavigationBar: widget.bottomNavigation,
            ),
          ) : Scaffold(
            backgroundColor: widget.backgroundColor ?? getTheme(context).scaffoldBackgroundColor,
            body: widget.child,
            bottomNavigationBar: widget.bottomNavigation,
          ),
        );
      },
    );
  }
}
