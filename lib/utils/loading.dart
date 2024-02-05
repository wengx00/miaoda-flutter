import 'package:flutter/cupertino.dart';

class MLoading {
  static OverlayEntry? _overlayEntry;

  BuildContext context;

  MLoading._internal(this.context);

  static MLoading of(BuildContext context) {
    return MLoading._internal(context);
  }

  Function() show({
    Color? backgroundColor,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    double? scale,
  }) {
    _overlayEntry?.remove();
    Future.microtask(() {
      _overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          top: 100,
          left: 24,
          right: 24,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: padding,
                decoration: BoxDecoration(
                    borderRadius: borderRadius, color: backgroundColor),
                child: Transform.scale(
                  scale: scale ?? 1,
                  child: const CupertinoActivityIndicator(animating: true),
                ),
              ),
            ],
          ),
        ),
      );
      Overlay.of(context).insert(_overlayEntry!);
    });
    return () {
      MLoading.hide();
    };
  }

  static hide() {
    _overlayEntry?.remove();
  }
}
