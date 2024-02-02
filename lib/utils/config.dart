import 'dart:ui';

import 'package:flutter/cupertino.dart';

final GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();


class Config {
  static const apiBase = "https://www.ccream.cn/api";
  static const staticBase = "https://www.ccream.cn/api/static";

  static const storageToken = 'token';
  static const storageUserInfo = 'userinfo';

  static const primaryColor = Color(0xff5699ff);
}