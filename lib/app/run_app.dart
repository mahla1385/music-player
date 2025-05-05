



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/design/splash/splash_screen.dart';
import 'package:music/localization/app_localizations.dart';
import 'package:music/theme/theme_cubit.dart';

import '../bloc/language/bloc_language_cubit.dart';
import '../theme/app_theme.dart';
import '../utils/initial_bloc_widget.dart';

class RunApp extends StatelessWidget {
  const RunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InitialBlocWidget(
      child: BlocBuilder<BlocLanguageCubit, Locale>(
        builder: (context, Locale locate) {
          return BlocBuilder<BlocTheme, ThemeMode>(
            builder: (context, ThemeMode mode) {
              return MaterialApp(
                locale: locate,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                debugShowCheckedModeBanner: false,
                themeMode: mode,
                themeAnimationCurve: Curves.decelerate,
                theme: AppTheme.light,
                darkTheme: AppTheme.night,
                home: SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
