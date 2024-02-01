// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DataStore on _DataStore, Store {
  late final _$needToWaitAtom =
      Atom(name: '_DataStore.needToWait', context: context);

  @override
  int get needToWait {
    _$needToWaitAtom.reportRead();
    return super.needToWait;
  }

  @override
  set needToWait(int value) {
    _$needToWaitAtom.reportWrite(value, super.needToWait, () {
      super.needToWait = value;
    });
  }

  late final _$phoneAtom = Atom(name: '_DataStore.phone', context: context);

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$codeAtom = Atom(name: '_DataStore.code', context: context);

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$captchaVOAtom =
      Atom(name: '_DataStore.captchaVO', context: context);

  @override
  CaptchaVO? get captchaVO {
    _$captchaVOAtom.reportRead();
    return super.captchaVO;
  }

  @override
  set captchaVO(CaptchaVO? value) {
    _$captchaVOAtom.reportWrite(value, super.captchaVO, () {
      super.captchaVO = value;
    });
  }

  late final _$_DataStoreActionController =
      ActionController(name: '_DataStore', context: context);

  @override
  dynamic startTimer() {
    final _$actionInfo =
        _$_DataStoreActionController.startAction(name: '_DataStore.startTimer');
    try {
      return super.startTimer();
    } finally {
      _$_DataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decreaseNeedToWait() {
    final _$actionInfo = _$_DataStoreActionController.startAction(
        name: '_DataStore.decreaseNeedToWait');
    try {
      return super.decreaseNeedToWait();
    } finally {
      _$_DataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoginForm({String? phone, String? code}) {
    final _$actionInfo = _$_DataStoreActionController.startAction(
        name: '_DataStore.setLoginForm');
    try {
      return super.setLoginForm(phone: phone, code: code);
    } finally {
      _$_DataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCaptchaVO(CaptchaVO? value) {
    final _$actionInfo = _$_DataStoreActionController.startAction(
        name: '_DataStore.setCaptchaVO');
    try {
      return super.setCaptchaVO(value);
    } finally {
      _$_DataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
needToWait: ${needToWait},
phone: ${phone},
code: ${code},
captchaVO: ${captchaVO}
    ''';
  }
}
