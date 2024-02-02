import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:miaoda/store/user/user.dart';
import 'package:miaoda/utils/config.dart';
import 'package:miaoda/utils/dialog.dart';
import 'package:miaoda/utils/toast.dart';
import 'package:miaoda/utils/tools.dart';

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
      Map<String, dynamic>? query,
      void Function(int, int)? onSendProgress,
      void Function(int, int)? onReceiveProgress,
      CancelToken? cancelToken}) async {
    query ??= {};
    final userStore = UserStore.use();
    final Map<String, dynamic> headers =
        Map.from({'Content-Type': 'application/json; charset=utf-8'});
    if (userStore.token != null) {
      headers.putIfAbsent('Token', () => userStore.token);
      query.putIfAbsent('_', () => userStore.token);
    }
    try {
      final response = await dio.request("${Config.apiBase}$url",
          data: data,
          queryParameters: query,
          options: Options(method: method, headers: headers),
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          cancelToken: cancelToken);
      final result = CommonApiResult.fromJson(response.data);
      if (result.code == 200) return result.data;
      final context = Tools.currentContext();
      MToast.of(context!).message(result.msg, type: MToastType.error);
      throw result;
    } catch (err) {
      final context = Tools.currentContext();
      CommonApiResult? result;
      if (err is DioException && err.response?.data is Map<String, dynamic>) {
        result = CommonApiResult.fromJson(err.response!.data);
      }
      if (err is CommonApiResult) result = err;
      if (result != null) {
        if (result.code == 401) {
          await MDialog.of(context!).show(
            result.msg,
            cancelable: false,
            confirmColor: CupertinoColors.activeBlue,
          );
          Navigator.of(context).pushNamed("login");
          throw result;
        }
        MToast.of(context!).message(result.msg, type: MToastType.error);
        throw result;
      }
      MToast.of(context!).message("网络请求错误", type: MToastType.error);
      rethrow;
    }
  }
}
