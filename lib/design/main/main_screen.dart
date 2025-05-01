import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/bloc/bottom_navigator/bottom_navigator_cubit.dart';
import 'package:music/bloc/user/profile_cubit.dart';
import 'package:music/component/app_ui.dart';
import 'package:music/component/bottom_naviation/bottom_navigation_widget.dart';
import 'package:music/design/home/home_screen.dart';
import 'package:music/utils/tools_app.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin {
  PageController pageController = PageController(initialPage: 2);
  late StreamSubscription<BottomNavigatorState> listen;

  @override
  void initState() {
    super.initState();
    onListen();
  }

  @override
  void dispose() {
    pageController.dispose();
    listen.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AppUi(
      backgroundColor: getTheme(context).dialogTheme.backgroundColor,
      child: PageView(
        pageSnapping: false,
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [Container(), HomeScreen(), Container()],
      ),
      bottomNavigation: BottomNavigationWidget(),
    );
  }

  onListen() {
    context.read<ProfileCubit>().getProfile();
    final bottom = context.read<BottomNavigatorCubit>();
    listen = bottom.stream.listen(
      (event) {
        if (event is BottomNavigatorInitial) {
          pageController.jumpToPage(event.page);
        }
      },
    );
    bottom.updatePage(1);
  }

  @override
  bool get wantKeepAlive => true;
}
