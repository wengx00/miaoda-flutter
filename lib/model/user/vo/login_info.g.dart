// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginInfoVO _$LoginInfoVOFromJson(Map<String, dynamic> json) => LoginInfoVO(
      token: json['token'] as String,
      shouldUpdateInfo: json['shouldUpdateInfo'] as bool,
    );

Map<String, dynamic> _$LoginInfoVOToJson(LoginInfoVO instance) =>
    <String, dynamic>{
      'token': instance.token,
      'shouldUpdateInfo': instance.shouldUpdateInfo,
    };
