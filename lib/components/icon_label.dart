import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:miaoda/utils/config.dart';

class IconLabel extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool? selected;
  final Color selectedColor;
  final Color unselectedColor;
  final void Function()? onTap;

  const IconLabel(
      {super.key,
      required this.label,
      required this.icon,
      this.selected,
      this.selectedColor = Config.primaryColor,
      this.unselectedColor = Colors.black87,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: selected == true ? selectedColor : unselectedColor,
            ),
            Text(
              label,
              style: TextStyle(
                  fontSize: 12,
                  color: selected == true ? selectedColor : unselectedColor),
            )
          ],
        ),
      ),
    );
  }
}
