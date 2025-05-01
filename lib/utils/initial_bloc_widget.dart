import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/bloc/bottom_navigator/bottom_navigator_cubit.dart';
import 'package:music/bloc/language/bloc_language_cubit.dart';
import 'package:music/bloc/router/route_cubit.dart';
import 'package:music/bloc/user/profile_cubit.dart';
import 'package:music/theme/theme_cubit.dart';

class InitialBlocWidget extends StatelessWidget {
  final Widget child;

  const InitialBlocWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => BlocTheme()),
        BlocProvider(create: (BuildContext context) => BlocLanguageCubit()),
        BlocProvider(create: (BuildContext context) => RouteCubit()),
        BlocProvider(create: (BuildContext context) => BottomNavigatorCubit()),
        BlocProvider(create: (BuildContext context) => ProfileCubit()),
        BlocProvider(create: (BuildContext context) => BlocLanguageCubit()),

      ],
      child: child,
    );
  }
}
