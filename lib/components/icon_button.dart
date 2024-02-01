import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MIconButton extends StatelessWidget {
  final Icon icon;
  final Color backgroundColor;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final void Function()? onTap;
  final double? width;
  final double? height;
  const MIconButton(
      {super.key,
      required this.icon,
      required this.backgroundColor,
      this.padding,
      this.borderRadius,
      this.boxShadow,
      this.width,
      this.height,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(1000)),
          boxShadow: boxShadow),
      child: Material(
        child: Ink(
          decoration: BoxDecoration(color: backgroundColor),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: padding ?? const EdgeInsets.all(8.0),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
