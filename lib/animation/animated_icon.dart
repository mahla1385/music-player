
import 'package:flutter/material.dart';

class AnimIcon extends Icon {
  const AnimIcon(
      super.icon, {
        super.key,
        this.duration = Durations.short4,
        this.sizeAnim = true,
        this.color = Colors.black38,
        this.axis =Axis.horizontal,
        this.slide = true,
        this.size = 23,
        this.textDirection  = TextDirection.ltr
      });
  final Duration duration;
  final bool sizeAnim;
  final Axis? axis ;
  final Color? color;
  final double? size;
  final bool slide;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve:  Curves.easeInOutCirc,
      switchOutCurve: Curves.easeOutCubic,
      transitionBuilder: (child, animation) {
        child = FadeTransition(
          opacity: animation,
          child: child,
        );
        if (sizeAnim) {
          child = SizeTransition(

            axis: axis!,
            fixedCrossAxisSizeFactor: 1,
            sizeFactor: Tween<double>(begin: 0.0, end: 1).animate(animation),
            child: child,
          );
        }
        if (slide) {
          child = SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-0.0, -1.0),
              end: const Offset(-0.0, 0.0),
            ).animate(animation),
            child: child,
          );
        }
        return child;
      },
      child: Icon(
        icon!,
        textDirection: textDirection,
        size: size,
        color:  color,
      ),
    );
  }
}