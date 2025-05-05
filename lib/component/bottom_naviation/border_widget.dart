


import 'package:flutter/material.dart';

class BorderWidget extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final int? opacity;
  final Color? color;
  final Color? background;
  BorderWidget({super.key,
  this.padding = EdgeInsets.zero,
    this.height = 1,
    this.width = 1,
    this.background,
    this.color,
    this.opacity = 50


  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,height: height,
      color: (background != null) ? background : Colors.transparent,
      child: Padding(padding: padding!,
      child: Container(
        decoration: BoxDecoration(
          color: (color != null) ? color! :Theme.of(context).dividerColor.withAlpha(opacity!),
          borderRadius: BorderRadius.circular(20)
        ),
        width: width,height: height,
      ),
      ),
    );
  }
}
