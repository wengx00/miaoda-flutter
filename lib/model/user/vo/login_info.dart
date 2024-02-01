import 'package:json_annotation/json_annotation.dart';

part 'login_info.g.dart';

@JsonSerializable()
class LoginInfoVO {
  String token;
  bool shouldUpdateInfo;

  LoginInfoVO({required this.token, required this.shouldUpdateInfo});

  factory LoginInfoVO.fromJson(Map<String, dynamic> json) => _$LoginInfoVOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginInfoVOToJson(this);
}