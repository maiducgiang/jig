// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      email: json['email'] as String?,
      type: json['type'] as String?,
      password: json['password'] as String?,
      token: json['token'] as String?,
      userId: json['userId'] as int?,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'type': instance.type,
      'token': instance.token,
      'userId': instance.userId,
    };

AccountRequest _$AccountRequestFromJson(Map<String, dynamic> json) =>
    AccountRequest(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$AccountRequestToJson(AccountRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

AccountResponse _$AccountResponseFromJson(Map<String, dynamic> json) =>
    AccountResponse(
      code: json['code'] as int?,
      data: json['data'],
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AccountResponseToJson(AccountResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
