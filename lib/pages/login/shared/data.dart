import 'dart:async';

import 'package:miaoda/model/user/vo/captcha.dart';
import 'package:mobx/mobx.dart';

part 'data.g.dart';

class DataStore extends _DataStore with _$DataStore {
  DataStore._internal();

  static DataStore? _userStore;

  static DataStore use() {
    _userStore ??= DataStore._internal();
    return _userStore as DataStore;
  }
}

abstract class _DataStore with Store {
  @observable
  int needToWait = 0;

  @observable
  String phone = '';

  @observable
  String code = ''; // 短信验证码

  @observable
  CaptchaVO? captchaVO;

  // 短信验证码长度
  final codeLength = 6;

  Timer? timer;

  _setTimer(Timer timer) {
    if (this.timer != null) this.timer!.cancel();
    this.timer = timer;
  }

  @action
  startTimer() {
    needToWait = 60;
    _setTimer(Timer.periodic(const Duration(seconds: 1), (timer) {
      decreaseNeedToWait();
    }));
  }

  @action
  decreaseNeedToWait() {
    if (needToWait == 0) {
      if (timer != null) timer!.cancel();
      return;
    }
    needToWait--;
  }

  @action
  setLoginForm({String? phone, String? code}) {
    if (phone != null) this.phone = phone;
    if (code != null) this.code = code;
  }

  @action
  setCaptchaVO(CaptchaVO? value) {
    captchaVO = value;
  }

  dispose() {
    if (timer != null) timer!.cancel();
    needToWait = 0;
    phone = '';
    code = '';
  }
}
