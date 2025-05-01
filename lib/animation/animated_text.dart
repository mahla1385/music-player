import 'package:flutter/material.dart';
import 'package:music/utils/tools_app.dart';

class AnimatedText extends Text {
  const AnimatedText(super.data,
      {super.key,
      super.style,
      this.duration = Durations.short4,
      this.size = true,
      this.axis = Axis.horizontal,
      this.slide = true,
      this.maxLines,
      this.textAlign = TextAlign.start,
      this.textDirection = TextDirection.ltr});

  final TextAlign? textAlign;
  final Duration duration;
  final bool size;
  final Axis? axis;

  final int? maxLines;
  final bool slide;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: Curves.easeInOutCirc,
      switchOutCurve: Curves.easeOutCubic,
      transitionBuilder: (child, animation) {
        child = FadeTransition(
          opacity: animation,
          child: child,
        );
        if (size) {
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
              begin: const Offset(-0.0, -0.0),
              end: const Offset(-0.0, 0.0),
            ).animate(animation),
            child: child,
          );
        }
        return child;
      },
      child: Text(
        data!,
        textDirection: textDirection,
        textAlign: textAlign,
        maxLines: maxLines,
        key: ValueKey<String>(data!),
        style: style,
      ),
    );
  }
}

class AnimatedTextRich extends Text {
  const AnimatedTextRich(
    super.data, {
    super.key,
    super.style,
    this.duration = Durations.long1,
    this.size = true,
    this.showText = true,
    this.show = false,
    this.axis = Axis.horizontal,
    this.slide = true,
    this.textAlign = TextAlign.start,
    this.textDirection = TextDirection.rtl,
  });

  final TextAlign? textAlign;
  final Duration duration;
  final bool size;
  final bool showText;
  final bool show;
  final Axis? axis;

  final bool slide;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: Curves.decelerate,
      switchOutCurve: Curves.decelerate,
      transitionBuilder: (child, animation) {
        child = FadeTransition(
          opacity: animation,
          child: child,
        );
        if (size) {
          child = SizeTransition(
            axis: axis!,
            sizeFactor: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: child,
          );
        }
        if (slide) {
          child = SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        }
        return child;
      },
      child: Text.rich(
          textDirection: textDirection,
          textAlign: textAlign,
          key: ValueKey<String>(data!),
          style: style,
          TextSpan(
            children: <InlineSpan>[
              TextSpan(text: data!),
              TextSpan(
                text: showText
                    ? show
                        ? ' نمایش کمتر'
                        : ' نمایش بیشتر'
                    : "",
                style: style!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: style!.fontSize! - 1,
                    color: getTheme(context).dividerColor),
              ),
            ],
          )),
    );
  }
}


class TextView extends Text {
  TextView(
      String data, {
        Key? key,
        TextStyle? style,
        this.padding,
        TextAlign? textAlign,
        TextDirection? textDirection,
        Locale? locale,
        StrutStyle? strutStyle,
        TextWidthBasis? textWidthBasis,
        TextHeightBehavior? textHeightBehavior,
        TextScaler textScale = TextScaler.noScaling,
        TextOverflow? overflow,
        int? maxLines,
        Color? selectionColor,
        String? semanticsLabel,
        bool? softWrap,
      }) : super(
    data,
    key: key,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    locale: locale,
    strutStyle: strutStyle,
    textWidthBasis: textWidthBasis,
    textHeightBehavior: textHeightBehavior,
    overflow: overflow,
    maxLines: maxLines,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
  );
   final EdgeInsets? padding;
  static const Color defaultTextColor = Colors.blue;

  TextView.withDefaultColor(
      String data, this.padding, {
        Key? key,
        TextStyle? style,
      }) : super(
    data,
    key: key,
    style: style?.copyWith(color: defaultTextColor) ??
        TextStyle(color: defaultTextColor),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (padding == null) ? EdgeInsets.zero : padding!,
      child: Text(
        data!,
        textDirection: textDirection,
        textAlign: textAlign,
        textScaler: TextScaler.linear(1.05),
        overflow: overflow,
        maxLines: maxLines,
        locale: locale,
        selectionColor: selectionColor,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textHeightBehavior: textHeightBehavior,
        textWidthBasis: textWidthBasis,
        key: ValueKey<String>(data!),
        style: style,
      ),
    );
  }
}