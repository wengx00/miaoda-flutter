import 'package:flutter/cupertino.dart';

class MDialog {
  BuildContext? currentContext;

  MDialog._internal(this.currentContext);

  static MDialog of(BuildContext context) {
    return MDialog._internal(context);
  }

  Future show(
    String msg, {
    String? title,
    bool? cancelable,
    String? confirmText,
    String? cancelText,
    Color? confirmColor,
    Color? cancelColor,
    Function()? onConfirm,
    Function()? onCancel,
    Function()? onClose,
  }) async {
    assert(currentContext != null, "Context must not be null.");
    await showCupertinoDialog(
      context: currentContext!,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title ?? "提示"),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            msg,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        actions: [
          CupertinoButton(
            child: Text(
              confirmText ?? "确认",
              style: TextStyle(
                color: confirmColor ?? CupertinoColors.destructiveRed,
                fontSize: 16,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              if (onConfirm != null) onConfirm();
            },
          ),
          if (cancelable != false)
            CupertinoButton(
              child: Text(
                cancelText ?? "取消",
                style: TextStyle(
                  color: cancelColor ?? CupertinoColors.activeBlue,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                if (onCancel != null) onCancel();
              },
            ),
        ],
      ),
    );
    if (onClose != null) return onClose();
    return;
  }
}
