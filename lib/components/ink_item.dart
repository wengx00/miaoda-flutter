import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InkItem extends StatefulWidget {
  const InkItem(
      {super.key,
      required this.child,
      this.borderRadius,
      this.backgroundColor});

  final Widget child;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;

  @override
  State<InkItem> createState() => _InkItemState();
}

class _InkItemState extends State<InkItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
      ),
      child: Material(
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            color: widget.backgroundColor,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
