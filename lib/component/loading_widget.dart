import 'package:music/utils/tools_app.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double? width;
  final double? size;
  final Color? color;
  final Color? background;
  const LoadingWidget({super.key,this.background,this.color,this.size  = 35,this.width  = 1.8 });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(width: size,height: size,
      child: CircularProgressIndicator(
        backgroundColor: background,
        strokeWidth: width!,color: (color != null) ? color : getTheme(context).primaryColor,),
      ),
    );
  }
}
