import 'package:miaoda/model/user/vo/user_info.dart';
import 'package:miaoda/utils/config.dart';
import 'package:miaoda/utils/json_prefs.dart';
import 'package:mobx/mobx.dart';

part 'user.g.dart';

class UserStore extends _UserStore with _$UserStore {
  UserStore._internal();

  static UserStore? _userStore;

  static UserStore use() {
    _userStore ??= UserStore._internal();
    return _userStore as UserStore;
  }
}

abstract class _UserStore with Store {
  @observable
  String? token;

  @observable
  UserInfoVO? userInfo;

  @action
  initFromPrefs() async {
    token = await JsonPrefs.get(Config.storageToken);
    final userInfoJson = await JsonPrefs.get(Config.storageUserInfo);
    if (userInfoJson == null) {
      userInfo = null;
      return;
    }
    userInfo = UserInfoVO.fromJson(userInfoJson);
  }

  @action 
  setUserInfo(UserInfoVO? value) async {
    await JsonPrefs.set(Config.storageUserInfo, value?.toJson());
    userInfo = value;
  }

  @action
  setToken(String? value) async {
    await JsonPrefs.set(Config.storageToken, value);
  }

}
