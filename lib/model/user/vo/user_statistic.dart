import 'package:json_annotation/json_annotation.dart';

part 'user_statistic.g.dart';

@JsonSerializable()
class UserStatisticVO {
  ///粉丝数
  int fanCount;

  ///关注数
  int followCount;

  ///动态数
  int postCount;

  ///获赞数
  int raisedCount;

  UserStatisticVO({
    required this.fanCount,
    required this.followCount,
    required this.postCount,
    required this.raisedCount,
  });

  factory UserStatisticVO.fromJson(Map<String, dynamic> json) =>
      _$UserStatisticVOFromJson(json);

  Map<String, dynamic> toJson() => _$UserStatisticVOToJson(this);
}
