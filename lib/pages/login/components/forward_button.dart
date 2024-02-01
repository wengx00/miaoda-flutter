import 'package:flutter/material.dart';
import 'package:miaoda/components/icon_button.dart';
import 'package:miaoda/utils/config.dart';

class ForwardButton extends StatefulWidget {
  const ForwardButton({super.key, this.onTap});
  
  final void Function()? onTap;

  @override
  State<ForwardButton> createState() => _ForwardButtonState();
}

class _ForwardButtonState extends State<ForwardButton> {
  @override
  Widget build(BuildContext context) {
    return MIconButton(
      backgroundColor: Config.primaryColor,
      icon: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
        size: 42,
      ),
      boxShadow: const [
        BoxShadow(
          color: Colors.blue,
          blurRadius: 2,
          offset: Offset(0, 1),
        )
      ],
      onTap: widget.onTap,
    );
  }
}
