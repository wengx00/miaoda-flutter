import 'package:json_annotation/json_annotation.dart';

part 'send_sms.g.dart';

@JsonSerializable()
class SendSmsDTO {
  String reqToken;
  String validCode;
  String phone;

  SendSmsDTO({required this.reqToken, required this.validCode, required this.phone});

  factory SendSmsDTO.fromJson(Map<String, dynamic> json) => _$SendSmsDTOFromJson(json);
  Map<String, dynamic> toJson() => _$SendSmsDTOToJson(this);
}