import 'package:music/animation/animated_text.dart';
import 'package:music/animation/animation_widget.dart';
import 'package:music/utils/theme_style.dart';
import 'package:music/utils/tools_app.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void toastError({required BuildContext context,String? text}){
  late FToast fToast = FToast();
  fToast.init(context);
  Widget customToast = AnimationWidget(
    delay: 0,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 9.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.7),
        color: getThemeSuper(context).errorColor,
      ),
      child: Wrap(
        children: [
          TextView(

            (text == null) ? "" : text,
            style: ThemeStyle.normalStyle.copyWith(
              fontSize: 12,
              color: Colors.white,
            ),
            maxLines: 2,
            textAlign: TextAlign.right,

          ),
        ],
      ),
    ),
  );
  fToast.showToast(
    child: customToast,
    gravity: ToastGravity.BOTTOM,
    fadeDuration: Duration(milliseconds: 130),
    toastDuration: const Duration(milliseconds: 1300),
  );
}
void toastSuccess({required BuildContext context,
  String? text}){
  late FToast fToast = FToast();
  fToast.init(context);
  Widget customToast = AnimationWidget(
    delay: 0,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 9.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.7),
        color: getThemeSuper(context).successColor,
      ),
      child: Wrap(
        children: [
          TextView(

            (text == null) ? "" : text,
            style: ThemeStyle.normalStyle.copyWith(
              fontSize: 12,
              color: Colors.white,
            ),
            maxLines: 2,
            textAlign: TextAlign.right,

          ),
        ],
      ),
    ),
  );
  fToast.showToast(
    child: customToast,
    gravity: ToastGravity.BOTTOM,
    fadeDuration: Duration(milliseconds: 130),
    toastDuration: const Duration(milliseconds: 1300),

  );
}
void toastWarring({required BuildContext context,String? text}){
  late FToast fToast = FToast();
  fToast.init(context);
  Widget customToast = AnimationWidget(
    delay: 0,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 9.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.7),
        color: getThemeSuper(context).warningColor,
      ),
      child: Wrap(
        children: [
          TextView(

            (text == null) ? "" : text,
            style: ThemeStyle.normalStyle.copyWith(
              fontSize: 12,
              color: Colors.white,
            ),
            maxLines: 2,
            textAlign: TextAlign.right,

          ),
        ],
      ),
    ),
  );
  fToast.showToast(
    child: customToast,
    gravity: ToastGravity.BOTTOM,
    fadeDuration: Duration(milliseconds: 130),
    toastDuration: const Duration(milliseconds: 1300),
  );
}
void toastInfo({required BuildContext context,String? text}){
  late FToast fToast = FToast();
  fToast.init(context);
  Widget customToast = AnimationWidget(
    delay: 0,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.7),
        color: getThemeSuper(context).infoColor,
      ),
      child: Wrap(
        children: [
          TextView(

            (text == null) ? "" : text,
            style: ThemeStyle.normalStyle.copyWith(
                fontSize: 12,
                color: Colors.white,fontWeight: FontWeight.bold,height: 1.9
            ),
            maxLines: 2,
            textAlign: TextAlign.right,

          ),
        ],
      ),
    ),
  );
  fToast.showToast(
    child: customToast,
    gravity: ToastGravity.BOTTOM,
    fadeDuration: Duration(milliseconds: 130),
    toastDuration: const Duration(milliseconds: 1800),
  );
}