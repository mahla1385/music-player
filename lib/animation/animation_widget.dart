import 'dart:async';

import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {
  final Widget child;
  final int? delay;
  final Duration? duration;
  final bool? isUp;
  final bool? revers;

  const AnimationWidget(
      {super.key, this.isUp = true,this.revers = false,this.duration = Durations.short3, required this.child, this.delay = 250});

  @override
  createState() => _AnimationWidget();
}

class _AnimationWidget extends State<AnimationWidget>
    with TickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();
    if (widget.isUp!) {
      if(widget.revers!){
        _animController = AnimationController(
            vsync: this, duration: widget.duration);
        final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
        _animOffset =
            Tween<Offset>(begin: const Offset(0.3, 0.0), end: Offset.zero)
                .animate(curve);
// ignore: unnecessary_null_comparison
        if (widget.delay == null) {
          _animController.forward();
        } else {
          Timer(Duration(milliseconds: widget.delay!), () {
            if(mounted)  _animController.forward();
          });
        }
      }else{
        _animController = AnimationController(
            vsync: this, duration: widget.duration);
        final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
        _animOffset =
            Tween<Offset>(begin: const Offset(0.0, 0.3), end: Offset.zero)
                .animate(curve);
// ignore: unnecessary_null_comparison
        if (widget.delay == null) {
          _animController.forward();
        } else {
          Timer(Duration(milliseconds: widget.delay!), () {
            if(mounted)  _animController.forward();
          });
        }
      }


    } else {
      if(widget.revers!){
        _animController = AnimationController(
            vsync: this,
            duration: widget.duration,
            upperBound: 1.0,
            lowerBound: 0.0);

        final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
        _animOffset =
            Tween<Offset>(begin: const Offset(0.8, 0.0), end: Offset.zero)
                .animate(curve);
// ignore: unnecessary_null_comparison
        if (widget.delay == null) {
          _animController.forward();
        } else {
          Timer(Duration(milliseconds: widget.delay!), () {
            _animController.forward();
          });
        }
      }else{
        _animController = AnimationController(
            vsync: this,
            duration: widget.duration,
            upperBound: 1.0,
            lowerBound: 0.0);

        final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
        _animOffset =
            Tween<Offset>(begin: const Offset(-0.8, 0.0), end: Offset.zero)
                .animate(curve);
// ignore: unnecessary_null_comparison
        if (widget.delay == null) {
          _animController.forward();
        } else {
          Timer(Duration(milliseconds: widget.delay!), () {
            _animController.forward();
          });
        }
      }

    }
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animController,
      child: FadeTransition(
        opacity: _animController,
        child: SlideTransition(
          position: _animOffset,
          child: widget.child,
        ),
      ),
    );
  }
}
