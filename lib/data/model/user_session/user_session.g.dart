// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSession _$UserSessionFromJson(Map<String, dynamic> json) => UserSession(
      token: json['token'] as String,
      userId: json['userId'] as String,
      status: json['status'] as int,
      isBoss: json['isBoss'] as bool?,
      totalRevenueInThisMonth:
          (json['totalRevenueInThisMonth'] as num?)?.toDouble() ?? 0,
      totalRevenueOutThisMonth:
          (json['totalRevenueOutThisMonth'] as num?)?.toDouble() ?? 0,
      allRevenueIn: (json['allRevenueIn'] as num?)?.toDouble() ?? 0,
      allRevenueOut: (json['allRevenueOut'] as num?)?.toDouble() ?? 0,
      totalOrderInThisMonth:
          (json['totalOrderInThisMonth'] as num?)?.toDouble() ?? 0,
      totalOrderOutThisMonth:
          (json['totalOrderOutThisMonth'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$UserSessionToJson(UserSession instance) =>
    <String, dynamic>{
      'token': instance.token,
      'userId': instance.userId,
      'status': instance.status,
      'isBoss': instance.isBoss,
      'totalRevenueInThisMonth': instance.totalRevenueInThisMonth,
      'totalRevenueOutThisMonth': instance.totalRevenueOutThisMonth,
      'allRevenueIn': instance.allRevenueIn,
      'allRevenueOut': instance.allRevenueOut,
      'totalOrderInThisMonth': instance.totalOrderInThisMonth,
      'totalOrderOutThisMonth': instance.totalOrderOutThisMonth,
    };
