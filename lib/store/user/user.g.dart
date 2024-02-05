// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  late final _$tokenAtom = Atom(name: '_UserStore.token', context: context);

  @override
  String? get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String? value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$userInfoAtom =
      Atom(name: '_UserStore.userInfo', context: context);

  @override
  UserInfoVO? get userInfo {
    _$userInfoAtom.reportRead();
    return super.userInfo;
  }

  @override
  set userInfo(UserInfoVO? value) {
    _$userInfoAtom.reportWrite(value, super.userInfo, () {
      super.userInfo = value;
    });
  }

  late final _$userStatisticAtom =
      Atom(name: '_UserStore.userStatistic', context: context);

  @override
  UserStatisticVO? get userStatistic {
    _$userStatisticAtom.reportRead();
    return super.userStatistic;
  }

  @override
  set userStatistic(UserStatisticVO? value) {
    _$userStatisticAtom.reportWrite(value, super.userStatistic, () {
      super.userStatistic = value;
    });
  }

  late final _$initFromPrefsAsyncAction =
      AsyncAction('_UserStore.initFromPrefs', context: context);

  @override
  Future initFromPrefs() {
    return _$initFromPrefsAsyncAction.run(() => super.initFromPrefs());
  }

  late final _$setUserInfoAsyncAction =
      AsyncAction('_UserStore.setUserInfo', context: context);

  @override
  Future setUserInfo(UserInfoVO? value) {
    return _$setUserInfoAsyncAction.run(() => super.setUserInfo(value));
  }

  late final _$setTokenAsyncAction =
      AsyncAction('_UserStore.setToken', context: context);

  @override
  Future setToken(String? value) {
    return _$setTokenAsyncAction.run(() => super.setToken(value));
  }

  late final _$setUserStatisticAsyncAction =
      AsyncAction('_UserStore.setUserStatistic', context: context);

  @override
  Future setUserStatistic(UserStatisticVO value) {
    return _$setUserStatisticAsyncAction
        .run(() => super.setUserStatistic(value));
  }

  @override
  String toString() {
    return '''
token: ${token},
userInfo: ${userInfo},
userStatistic: ${userStatistic}
    ''';
  }
}
