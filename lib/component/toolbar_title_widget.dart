

import 'package:music/animation/animated_text.dart';
import 'package:music/utils/theme_style.dart';
import 'package:music/utils/tools_app.dart';
import 'package:flutter/material.dart';


class ToolbarTitleWidget extends StatefulWidget {
  final String title;
  final bool? showBack;
  final List<Widget>? option;
  final VoidCallback? callback;
  final Alignment? alignment;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final IconData? iconBack;
  final Color? backgroundColor;
  final Color? IconColor;
  const ToolbarTitleWidget({super.key,this.textAlign,this.textStyle,this.IconColor,this.backgroundColor,this.iconBack = Icons.arrow_forward,this.alignment = Alignment.centerRight,this.callback,required this.title,this.showBack,this.option});

  @override
  State<ToolbarTitleWidget> createState() => _ToolbarTitleWidgetState();
}

class _ToolbarTitleWidgetState extends State<ToolbarTitleWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,color: (widget.backgroundColor != null) ? widget.backgroundColor : getTheme(context).scaffoldBackgroundColor,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: (widget.showBack != null && widget.showBack == true) ? 5 : 12),
      child: Row(
        children: [
          Visibility(
            visible: (widget.showBack != null && widget.showBack == true),
            replacement: SizedBox.shrink(),
            child: IconButton(
                style: IconButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: ()=>(widget.callback == null) ? popPage.call(context) : widget.callback!.call(),
                icon: Icon(Icons.arrow_back_ios_new,fill: 1.0,color: widget.IconColor,size: 23,)),
          ),
          Expanded(child:     TextView(widget.title,
            textAlign: widget.textAlign,
            style:  (widget.textStyle == null) ? ThemeStyle.normalStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 12.5,
              color:  getTheme(context).dividerColor
            ) : widget.textStyle,
          ),),
          if(widget.option != null) ...widget.option!
        ],
      ),
    );
  }
}
