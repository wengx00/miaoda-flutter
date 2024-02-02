import 'package:miaoda/model/user/dto/login_by_phone.dart';
import 'package:miaoda/model/user/dto/send_sms.dart';
import 'package:miaoda/model/user/vo/captcha.dart';
import 'package:miaoda/model/user/vo/login_info.dart';
import 'package:miaoda/utils/request.dart';

final _$ = ApiRequest.instance;

class AuthApi {
  static Future<CaptchaVO> captcha() async {
    final json = await _$.request('/user/auth/captcha', method: 'GET');
    return CaptchaVO.fromJson(json);
  }

  static Future sendSMS(SendSmsDTO data) async {
    await _$.request('/user/auth/sendSMS', method: 'POST', data: data.toJson());
  }

  static Future<LoginInfoVO> loginByPhone(LoginByPhoneDTO data) async {
    final json = await _$.request('/user/auth/loginByPhone',
        method: 'POST', data: data.toJson());
    return LoginInfoVO.fromJson(json);
  }

  static Future logout() async {
    return await _$.request('/user/auth/logout', method: 'GET');
  }
}
