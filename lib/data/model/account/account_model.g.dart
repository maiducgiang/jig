// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: json['_id'] as String,
      phone: json['phone'] as String?,
      type: json['type'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      '_id': instance.id,
      'phone': instance.phone,
      'password': instance.password,
      'type': instance.type,
    };
