import 'package:miaoda/model/user/vo/user_info.dart';
import 'package:miaoda/model/user/vo/user_statistic.dart';
import 'package:miaoda/utils/request.dart';

final _$ = ApiRequest.instance.request;

class InfoApi {
  static Future<UserInfoVO> get() async {
    final json = await _$('/user/info/get', method: 'GET');
    return UserInfoVO.fromJson(json);
  }

  static Future<UserStatisticVO> statistic() async {
    final json = await _$('/user/info/statistic', method: 'GET');
    return UserStatisticVO.fromJson(json);
  }
}
