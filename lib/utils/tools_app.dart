
import 'package:music/theme/app_theme.dart';
import 'package:music/utils/fade_route.dart';
import 'package:flutter/material.dart';

ThemeData getTheme(BuildContext context){
  return Theme.of(context);
}

SuperTheme getThemeSuper(BuildContext context){
  return Theme.of(context).extension<SuperTheme>()!;
}

bool isHorizonApp(BuildContext context){
  return (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height);
}

Size getSize(BuildContext context){
  return MediaQuery.sizeOf(context);
}

double statusBarHeight(BuildContext context){
  return MediaQuery.of(context).padding.top;
}

double navigationHeight(BuildContext context){
  return MediaQuery.of(context).padding.bottom;
}

popPage(BuildContext context){
  if (Navigator.canPop(context)) {
    Navigator.pop(context);
  }else{
  }
}
popPageCount(BuildContext context,int count){
  Navigator.of(context).popLastRoutes(count,context);
}

  Future<dynamic> pushPage({required BuildContext context,required Widget page}) async {
  return await Navigator.push(context, FadeRoute(page: page));
}
pushPageReplace({required BuildContext context,required Widget page}){
  Navigator.pushReplacement(context, FadeRoute(page: page));
}
pushPageRemove({required BuildContext context,required Widget page}){
  Navigator.pushAndRemoveUntil(context, FadeRoute(page: page),(route) => true,);
}