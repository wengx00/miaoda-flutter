import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfoVO {
  ///用户账号
  String account;
  ///头像
  String avatar;
  ///注册时间
  DateTime createTime;
  ///性别
  String gender;
  ///用户名
  String name;
  ///角色组
  List<UserRole> role;
  UserInfoVO({
    required this.account,
    required this.avatar,
    required this.createTime,
    required this.gender,
    required this.name,
    required this.role,
  });

  factory UserInfoVO.fromJson(Map<String, dynamic> json) => _$UserInfoVOFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoVOToJson(this);
}

@JsonSerializable()
class UserRole {
  ///角色描述
  String attribute;
  ///角色ID
  double id;
  ///角色名称
  String label;
  UserRole({
    required this.attribute,
    required this.id,
    required this.label,
  });

  factory UserRole.fromJson(Map<String, dynamic> json) => _$UserRoleFromJson(json);
  Map<String, dynamic> toJson() => _$UserRoleToJson(this);
}
