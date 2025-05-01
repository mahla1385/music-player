import 'package:flutter/material.dart';
import 'package:music/animation/animated_text.dart';
import 'package:music/animation/animation_widget.dart';
import 'package:music/component/app_ui.dart';
import 'package:music/component/loading_widget.dart';
import 'package:music/database/database_user.dart';
import 'package:music/design/login/login_register_screen.dart';
import 'package:music/design/main/main_screen.dart';
import 'package:music/gen/assets.gen.dart';
import 'package:music/utils/theme_style.dart';
import 'package:music/utils/tools_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return AppUi(
      useSafeArea: false,
        child: _content);
  }


  Widget get _content => Container(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimationWidget(
                    child: Assets.images.logo.image(width: 200, height: 200,color: getTheme(context).primaryColor)),
              ],
            )),
            SizedBox(
              height: 70,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: LoadingWidget(
                    size: 20,
                  )),
                  TextView(
                    'v1.0.0',

                    style: ThemeStyle.normalStyle
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 10,color: getTheme(context).dividerColor),
                  )
                ],
              ),
            )
          ],
        ),
      );

  @override
  void initState() {
    super.initState();
    onVerifiedUser.call();
  }

  onVerifiedUser() async {
    await DBUser.isCheckLogin().then((checkLogin) async {
      if(checkLogin == true){
        pushPageRemove(context: context, page: MainScreen());
      }else{
        pushPageRemove(context: context, page: LoginRegisterScreen());
      }
    },);
  }

}
