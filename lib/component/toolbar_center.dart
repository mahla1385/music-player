


import 'package:music/animation/animated_text.dart';
import 'package:music/utils/theme_style.dart';
import 'package:flutter/material.dart';

class ToolbarCenter extends StatelessWidget {
  final bool? showBack;
  final VoidCallback? onBack;
  final String title;
  final List<Widget>? listRight;
  final List<Widget>? listLeft;
  const ToolbarCenter({super.key,
  required this.title,
    this.listLeft,
    this.listRight,
    this.onBack,
    this.showBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 56,
      child: Stack(
        children: [
          Center(child: TextView(title,style: ThemeStyle.normalStyle.copyWith(fontWeight: FontWeight.bold,fontSize: 15),),),
          SizedBox.expand(child: Row(
            children: [
              if(showBack != null && showBack == true) IconButton(onPressed: (onBack != null) ? onBack : (){}, icon: Icon(Icons.arrow_back_ios_rounded,size: 23,)),

            ],
          ),),
          SizedBox.expand(child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if(listRight != null) ...listRight!
            ],)),
          SizedBox.expand(child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if(listLeft != null) ...listLeft!
            ],)),



        ],
      ),
    );
  }
}
