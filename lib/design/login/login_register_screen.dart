import 'dart:async';

import 'package:music/animation/animated_text.dart';
import 'package:music/animation/animation_widget.dart';
import 'package:music/api/config/api_base.dart';
import 'package:music/component/app_ui.dart';
import 'package:music/component/loading_widget.dart';
import 'package:music/component/toast.dart';
import 'package:music/design/login/login_screen.dart';
import 'package:music/design/login/register_screen.dart';
import 'package:music/gen/assets.gen.dart';
import 'package:music/theme/app_theme.dart';
import 'package:music/utils/tools_app.dart';
import 'package:music/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../component/gap.dart';
import '../../utils/theme_style.dart';

class LoginRegisterScreen extends StatefulWidget {
  const LoginRegisterScreen({super.key});

  @override
  State<LoginRegisterScreen> createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  TypeState typeState = TypeState.init;
  String? urlInstagram = "https://instagram.com/puzzletak",phone = "09914046626";


  @override
  Widget build(BuildContext context) {
    return AppUi(
        useSafeArea: false,
        child: Stack(
      children: [
        _background,
        _support,
        _content
      ],
    ));
  }

  Widget get _background => Stack(
    children: [
      Positioned(
          width: getSize(context).width * 1.5,
          height: getSize(context).width * 1.5,
          left: (getSize(context).width * 0.20),
          top: -(getSize(context).height * 0.4),
          child: Container(
            decoration: BoxDecoration(
                color:  getTheme(context).primaryColorDark.withAlpha(10),
                borderRadius: BorderRadius.circular(1500)
            ),
          )),
      Positioned(
          width: getSize(context).width * 1.1,
          height: getSize(context).width * 1.1,
          left: (getSize(context).width * 0.08),
          top: -(getSize(context).height * 0.15),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: getTheme(context).primaryColorDark.withAlpha(15),width: 1),
                borderRadius: BorderRadius.circular(1500)
            ),
          )),
      Positioned(
          width: getSize(context).width * 1.1,
          height: getSize(context).width * 1.1,
          left: -(getSize(context).width * 0.95),
          top: (getSize(context).height * 0.62),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: getTheme(context).primaryColorDark.withAlpha(20),width: 1),
                borderRadius: BorderRadius.circular(0)
            ),
          )),
      Positioned(
          width: getSize(context).width * 0.8,
          height: getSize(context).width * 0.8,
          left: -(getSize(context).width * 0.6),
          top: (getSize(context).height * 0.65),
          child: Transform.rotate(
            angle: 65,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: getTheme(context).primaryColorDark.withAlpha(20),width: 1),
                  borderRadius: BorderRadius.circular(0)
              ),
            ),
          )),
    ],
  );
  Widget get _content => Container(
    child: Column(
      children: [
        SizedBox(height: 60,),
        Expanded(child: Center(
          child: SingleChildScrollView(
            child: AnimationWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.images.logo.image(width: 200,height: 200,color: getTheme(context).dividerColor),
                  Gap(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Container(
                      width: double.maxFinite,height: 55,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: getTheme(context).primaryColorDark,
                              foregroundColor: getTheme(context).scaffoldBackgroundColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(lowRadius * 5))
                          ),
                          onPressed: (typeState ==TypeState.loading) ? null : onClickBtnRegister, child: (typeState ==TypeState.loading) ? LoadingWidget(
                        background: Colors.transparent,size: 25,
                        color: Colors.white,
                      ) :TextView("Create New Account",
                        style: ThemeStyle.normalStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 13

                        ),
                      )),
                    ),
                  ),
                  Gap(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Container(
                      width: double.maxFinite,height: 55,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: getTheme(context).scaffoldBackgroundColor,
                              side: BorderSide(color: getTheme(context).primaryColorDark,width: 1.5),
                              foregroundColor: getTheme(context).primaryColorDark,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(lowRadius * 5))
                          ),
                          onPressed: (typeState ==TypeState.loading) ? null : onClickBtnLogin, child: (typeState ==TypeState.loading) ? LoadingWidget(
                        background: Colors.transparent,size: 25,
                        color: Colors.white,
                      ) :TextView("Login",
                        style: ThemeStyle.normalStyle.copyWith(
                          fontWeight: FontWeight.bold,
                            fontSize: 13,
                          color: getTheme(context).dividerColor

                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),

        Gap(height: 10,),

      ],
    ),
  );
  Widget get _support => Positioned(
      top: getSize(context).height * 0.83,
      left: (getSize(context).width * 0.5) - 75,
      child: Container(
        child: Column(
          spacing: 10,
          children: [
            TextView("Ways of communication",style: ThemeStyle.normalStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 12
            ),),
            Row(
              spacing: 15,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: getTheme(context).hintColor.withAlpha(120),
                        foregroundColor: getTheme(context).primaryColorDark,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(lowRadius * 2))
                    ),
                    onPressed: (){Utils.launchURL('tel:$phone');}, child: Icon(Icons.call,size: 23,color: getTheme(context).primaryColorDark,)),
                 TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: getTheme(context).hintColor.withAlpha(120),
                        foregroundColor: getTheme(context).primaryColorDark,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(lowRadius * 2))
                    ),
                    onPressed: (){Utils.launchURL(urlInstagram!);}, child: Icon(MdiIcons.instagram,size: 23,color: getTheme(context).primaryColorDark,))
              ],
            )
          ],
        ),
      ));

  onClickBtnLogin(){
    pushPage(context: context, page: LoginScreen());
  }
  onClickBtnRegister(){
    pushPage(context: context, page: RegisterScreen());
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }



}
