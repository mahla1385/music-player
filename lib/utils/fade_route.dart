

import 'package:animations/animations.dart';
import 'package:music/bloc/router/route_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({required this.page})
      : super(
    barrierDismissible: false,
    maintainState: true,
    opaque: true,
    reverseTransitionDuration: Duration(milliseconds: 150),
    fullscreenDialog: true,
    transitionDuration: Duration(milliseconds: 150),
    pageBuilder: (

        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        ),
  );
}

extension NavigatorExtensions on NavigatorState {
  void popLastRoutes(int count,BuildContext context) {
    int _count = (context.read<RouteCubit>().state.routeCount - count);
    if (canPop()) {
      popUntil((route) {
        if(context.read<RouteCubit>().state.routeCount >  _count){
          return false;
        }else{
          return true;
        }
      });
    }
  }
}

class MyNavigatorObserver extends NavigatorObserver {
  int _routeCount = 0;

  @override
  void didPush(Route route, Route? previousRoute) {
    _routeCount++;
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _routeCount--;
  }

  int get routeCount => _routeCount;
}
