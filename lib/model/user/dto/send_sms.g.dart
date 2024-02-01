// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_sms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendSmsDTO _$SendSmsDTOFromJson(Map<String, dynamic> json) => SendSmsDTO(
      reqToken: json['reqToken'] as String,
      validCode: json['validCode'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$SendSmsDTOToJson(SendSmsDTO instance) =>
    <String, dynamic>{
      'reqToken': instance.reqToken,
      'validCode': instance.validCode,
      'phone': instance.phone,
    };
