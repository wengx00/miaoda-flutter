import 'package:json_annotation/json_annotation.dart';

part 'login_by_phone.g.dart';

@JsonSerializable()
class LoginByPhoneDTO {
  String phone;
  String code;

  LoginByPhoneDTO({required this.code, required this.phone});

  factory LoginByPhoneDTO.fromJson(Map<String, dynamic> json) => _$LoginByPhoneDTOFromJson(json);
  Map<String, dynamic> toJson() => _$LoginByPhoneDTOToJson(this);
}
