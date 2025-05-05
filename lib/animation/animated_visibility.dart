import 'package:flutter/material.dart';

class AnimatedVisibility extends StatelessWidget {
  const AnimatedVisibility({
    super.key,
    required this.visible,
    this.axis = Axis.horizontal,
    this.duration = Durations.short3,
    this.padding = EdgeInsets.zero,
    required this.child,
    this.replacement
  });

  final bool visible;
  final Axis? axis;
  final EdgeInsets padding;
  final Widget child;
  final Duration? duration;
  final Widget? replacement;

  @override
  Widget build(BuildContext context) {


    return AnimatedSwitcher(
      duration: duration!,
      transitionBuilder: (child, animation) =>
          SizeTransition(
        sizeFactor: animation,
        axisAlignment: 0,
        child: FadeTransition(opacity: animation, child: child),
      ),
      child: visible
          ? AnimatedPadding(
              padding: padding,
              duration: duration!,
              child: visible ? child : SizedBox.shrink(),
            )
          : (replacement == null) ? SizedBox.shrink() : replacement,
    );
  }
}
