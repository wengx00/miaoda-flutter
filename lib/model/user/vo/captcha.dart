import 'package:json_annotation/json_annotation.dart';

part 'captcha.g.dart';

@JsonSerializable()
class CaptchaVO {
  String captcha;
  String reqToken;

  CaptchaVO({required this.captcha, required this.reqToken});

  factory CaptchaVO.fromJson(Map<String, dynamic> json) => _$CaptchaVOFromJson(json);
  Map<String, dynamic> toJson() => _$CaptchaVOToJson(this);
}