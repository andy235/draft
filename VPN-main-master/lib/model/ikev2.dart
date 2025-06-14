import 'package:json_annotation/json_annotation.dart';

part 'ikev2.g.dart';
@JsonSerializable()
class ikev2{
  String server;
  String user;
  String password;
  String? countryName;
  double? ping;
  DateTime? lastPing;
  String countryCode;

  ikev2({required this.server,required this.password, required this.user,required this.countryCode,this.countryName});

  factory ikev2.fromJson(Map<String,dynamic> json)=>_$ikev2FromJson(json);
  Map<String,dynamic>toJson()=>_$ikev2ToJson(this);
}