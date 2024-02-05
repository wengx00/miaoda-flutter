// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_statistic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStatisticVO _$UserStatisticVOFromJson(Map<String, dynamic> json) =>
    UserStatisticVO(
      fanCount: json['fanCount'] as int,
      followCount: json['followCount'] as int,
      postCount: json['postCount'] as int,
      raisedCount: json['raisedCount'] as int,
    );

Map<String, dynamic> _$UserStatisticVOToJson(UserStatisticVO instance) =>
    <String, dynamic>{
      'fanCount': instance.fanCount,
      'followCount': instance.followCount,
      'postCount': instance.postCount,
      'raisedCount': instance.raisedCount,
    };
