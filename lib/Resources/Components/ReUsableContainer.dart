import 'package:flutter/material.dart';

class ReUsable_Container extends StatelessWidget {
  double? height;
  double? width;
  Color? color;
  BorderRadius? radius;
  Widget? child;
  ReUsable_Container(
      {super.key,
      this.height,
      this.width,
      this.radius,
      this.color,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: color, borderRadius: radius),
      child: child,
    );
  }
}
