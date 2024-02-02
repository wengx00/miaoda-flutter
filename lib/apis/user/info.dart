import 'package:miaoda/model/user/vo/user_info.dart';
import 'package:miaoda/utils/request.dart';

final _$ = ApiRequest.instance.request;

class InfoApi {
  static Future<UserInfoVO> get() async {
    final json = await _$('/user/info/get', method: 'GET');
    return UserInfoVO.fromJson(json);
  }
}
