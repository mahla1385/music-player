import 'dart:async';

import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:music/animation/animated_text.dart';
import 'package:music/animation/animation_widget.dart';
import 'package:music/api/config/api_base.dart';
import 'package:music/component/app_ui.dart';
import 'package:music/component/loading_widget.dart';
import 'package:music/component/toast.dart';
import 'package:music/design/login/register_screen.dart';
import 'package:music/design/main/main_screen.dart';
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();
  TypeState typeState = TypeState.init;
  bool _seePass = false;
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
        Expanded(child: Align(
          alignment: Alignment(0.5, -0.3),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.images.logo.image(width: 120,height: 120,color: getTheme(context).primaryColor),
                // Gap(height: 5,),
                TextView("Register",style: ThemeStyle.normalStyle.copyWith(fontSize: 30,fontWeight: FontWeight.bold),),
                Gap(height: 5,),
                TextView("Create new account",style: ThemeStyle.normalStyle.copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
                Gap(height: 15,),
                buildInput("Username",controllerUsername,FeatherIcons.user,TextInputType.text,false),
                buildInput("Password",controllerPassword,Icons.password_rounded,TextInputType.visiblePassword,true),
                Gap(),
                AnimationWidget(
                  isUp: true,
                  delay: 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Container(
                      width: double.maxFinite,height: 55,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: getTheme(context).primaryColorDark,
                              foregroundColor: getTheme(context).scaffoldBackgroundColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(lowRadius * 2.5))
                          ),
                          onPressed: (typeState ==TypeState.loading) ? null : onClickBtnLogin, child: (typeState ==TypeState.loading) ? LoadingWidget(
                        background: Colors.transparent,size: 25,
                        color: Colors.white,
                      ) :TextView("Login",
                        style: ThemeStyle.normalStyle.copyWith(
                          fontWeight: FontWeight.bold,

                        ),
                      )),
                    ),
                  ),
                ),
                Gap(height: 20,),
                TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(lowRadius * 5),
                      ),
                      foregroundColor: getThemeSuper(context).errorColor
                    ),
                    onPressed: (){}, child: TextView("Forgot password?",style: ThemeStyle.normalStyle.copyWith(color: getThemeSuper(context).errorColor)))
              ],
            ),
          ),
        )),

        Gap(height: 10,),

      ],
    ),
  );

  Widget buildInput(String hint,TextEditingController control,IconData icon,TextInputType inputType,bool passMode){
    return AnimationWidget(
      isUp: true,
      delay: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 7),
        child: Container(
          width: double.maxFinite,height: 58,
          decoration: BoxDecoration(
              color: getTheme(context).hintColor.withAlpha(140),
              borderRadius: BorderRadius.circular(lowRadius * 2)
          ),
          padding: EdgeInsets.only(left: 15,right: 5),
          alignment: Alignment.centerLeft,
          child: Row(
            textDirection: TextDirection.ltr,
            children: [
              Icon(icon),
              Gap(width: 13,),
              Expanded(
                child: TextField(
                  controller: control,
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                  keyboardType: inputType,
                  cursorOpacityAnimates: true,
                  style: ThemeStyle.normalStyle.copyWith(
                      fontSize: 14
                  ),
                  obscureText: (hint.contains('Password')) && !_seePass,
                  decoration: InputDecoration(
                    isDense: false,

                    hintText: hint,
                    hintStyle: ThemeStyle.normalStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        color:  getTheme(context).dividerColor.withAlpha(80),
                        fontSize: 14
                    ),
                  ),
                ),
              ),
              if(passMode) IconButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero
                  ),
                  onPressed: (){setState(() {
                    _seePass = !_seePass;
                  });}, icon: Icon(_seePass ? Icons.visibility_rounded : Icons.visibility_off_rounded,color: !_seePass ? getThemeSuper(context).successColor :getTheme(context).primaryColorDark,size: 20,))
            ],
          ),
        ),
      ),
    );
  }

  Widget get _support => Positioned(
      top: getSize(context).height * 0.88,
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
    pushPageRemove(context: context, page: MainScreen());
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
