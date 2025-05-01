


import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  final double? height;
  final double? width;
  const Gap({super.key,
  this.height = 10,
  this.width = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width,height: height,);
  }
}
