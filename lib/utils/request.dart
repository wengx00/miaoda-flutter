import 'package:dio/dio.dart';
import 'package:miaoda/store/user/user.dart';
import 'package:miaoda/utils/config.dart';

class CommonApiResult {
  final int code;
  final dynamic data;
  final String msg;

  CommonApiResult({this.code = 200, this.data, this.msg = "success"});
  CommonApiResult.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        data = json['data'],
        msg = json['msg'];
}

class ApiRequest {
  static ApiRequest? _instance;
  final Dio dio;

  ApiRequest._internal() : dio = Dio();

  static ApiRequest get instance {
    _instance ??= ApiRequest._internal();
    return _instance!;
  }

  Future<dynamic> request(String url,
      {required String method,
      Object? data,
      Map<String, dynamic> query = const {},
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress,
      CancelToken? cancelToken}) async {
    final userStore = UserStore.use();
    final Map<String, dynamic> headers =
        Map.from({'Content-Type': 'application/json; charset=utf-8'});
    if (userStore.token != null) {
      headers.putIfAbsent('Token', () => userStore.token);
      query.putIfAbsent('token', () => userStore.token);
    }
    final response = await dio.request("${Config.apiBase}$url",
        data: data,
        queryParameters: query,
        options: Options(method: method, headers: headers),
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        cancelToken: cancelToken);
    final result = CommonApiResult.fromJson(response.data);
    if (result.code == 200) return result.data;
    throw result;
  }
}
