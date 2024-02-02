// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoVO _$UserInfoVOFromJson(Map<String, dynamic> json) => UserInfoVO(
      account: json['account'] as String,
      avatar: json['avatar'] as String,
      createTime: DateTime.parse(json['createTime'] as String),
      gender: json['gender'] as String?,
      name: json['name'] as String,
      role: (json['role'] as List<dynamic>)
          .map((e) => UserRole.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserInfoVOToJson(UserInfoVO instance) =>
    <String, dynamic>{
      'account': instance.account,
      'avatar': instance.avatar,
      'createTime': instance.createTime.toIso8601String(),
      'gender': instance.gender,
      'name': instance.name,
      'role': instance.role,
    };

UserRole _$UserRoleFromJson(Map<String, dynamic> json) => UserRole(
      attribute: json['attribute'] as String,
      id: (json['id'] as num).toDouble(),
      label: json['label'] as String,
    );

Map<String, dynamic> _$UserRoleToJson(UserRole instance) => <String, dynamic>{
      'attribute': instance.attribute,
      'id': instance.id,
      'label': instance.label,
    };
