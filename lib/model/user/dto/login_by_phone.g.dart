// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_by_phone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginByPhoneDTO _$LoginByPhoneDTOFromJson(Map<String, dynamic> json) =>
    LoginByPhoneDTO(
      code: json['code'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$LoginByPhoneDTOToJson(LoginByPhoneDTO instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'code': instance.code,
    };
