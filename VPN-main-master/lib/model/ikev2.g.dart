// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ikev2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ikev2 _$ikev2FromJson(Map<String, dynamic> json) => ikev2(
      server: json['server'] as String,
      password: json['password'] as String,
      user: json['user'] as String,
      countryCode: json['countryCode'] as String,
      countryName: json['countryName'] as String?,
    )
      ..ping = (json['ping'] as num?)?.toDouble()
      ..lastPing = json['lastPing'] == null
          ? null
          : DateTime.parse(json['lastPing'] as String);

Map<String, dynamic> _$ikev2ToJson(ikev2 instance) => <String, dynamic>{
      'server': instance.server,
      'user': instance.user,
      'password': instance.password,
      'countryName': instance.countryName,
      'ping': instance.ping,
      'lastPing': instance.lastPing?.toIso8601String(),
      'countryCode': instance.countryCode,
    };
