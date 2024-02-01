// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'captcha.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CaptchaVO _$CaptchaVOFromJson(Map<String, dynamic> json) => CaptchaVO(
      captcha: json['captcha'] as String,
      reqToken: json['reqToken'] as String,
    );

Map<String, dynamic> _$CaptchaVOToJson(CaptchaVO instance) => <String, dynamic>{
      'captcha': instance.captcha,
      'reqToken': instance.reqToken,
    };
