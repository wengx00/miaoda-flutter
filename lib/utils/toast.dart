import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum MToastType { info, success, error, warning, normal }

class MToast {
  static final _fToast = FToast();
  BuildContext? currentContext;

  MToast._internal(this.currentContext);

  static MToast of(BuildContext context) {
    _fToast.init(context);
    return MToast._internal(context);
  }

  message(
    String msg, {
    MToastType type = MToastType.normal,
  }) {
    Map<MToastType, Color> colorMap = {
      MToastType.normal: CupertinoColors.systemGrey6,
      MToastType.info: Colors.blue,
      MToastType.error: Colors.red[500]!,
      MToastType.warning: Colors.orange,
      MToastType.success: Colors.green,
    };
    Map<MToastType, Color> textColorMap = {
      MToastType.normal: Colors.black,
      MToastType.info: Colors.white,
      MToastType.error: Colors.white,
      MToastType.warning: Colors.white,
      MToastType.success: Colors.white,
    };
    Map<MToastType, IconData> iconMap = {
      MToastType.info: Icons.info,
      MToastType.error: Icons.dangerous,
      MToastType.warning: Icons.warning,
      MToastType.success: Icons.check_circle,
    };
    // Toast最大宽度
    final maxWidth = MediaQuery.of(currentContext!).size.width - 48;
    final textMaxWidth = maxWidth - 36;
    return _fToast.showToast(
      gravity: ToastGravity.TOP,
      isDismissable: true,
      fadeDuration: const Duration(milliseconds: 250),
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        decoration: BoxDecoration(
          color: colorMap[type],
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (type != MToastType.normal) ...[
              Icon(
                iconMap[type],
                size: 16,
                color: textColorMap[type],
              ),
              const SizedBox(width: 4),
            ],
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: textMaxWidth),
              child: Text(
                msg,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColorMap[type],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
