import 'package:jig/foundation/extension/number_formatting.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_session.g.dart';

@JsonSerializable()
class UserSession {
  UserSession(
      {required this.token,
      required this.userId,
      required this.status,
      this.isBoss,
      required this.totalRevenueInThisMonth,
      required this.totalRevenueOutThisMonth,
      required this.allRevenueIn,
      required this.allRevenueOut,
      required this.totalOrderInThisMonth,
      required this.totalOrderOutThisMonth});
  final String token;
  final String userId;

  final int status;
  final bool? isBoss;
  @JsonKey(
      name: 'totalRevenueInThisMonth', includeIfNull: true, defaultValue: 0)
  final double totalRevenueInThisMonth;
  @JsonKey(
      name: 'totalRevenueOutThisMonth', includeIfNull: true, defaultValue: 0)
  final double totalRevenueOutThisMonth;
  @JsonKey(name: 'allRevenueIn', includeIfNull: true, defaultValue: 0)
  final double allRevenueIn;
  @JsonKey(name: 'allRevenueOut', includeIfNull: true, defaultValue: 0)
  final double allRevenueOut;
  @JsonKey(name: 'totalOrderInThisMonth', includeIfNull: true, defaultValue: 0)
  final double totalOrderInThisMonth;
  @JsonKey(name: 'totalOrderOutThisMonth', includeIfNull: true, defaultValue: 0)
  final double totalOrderOutThisMonth;

  String get getTotalRevenueInThisMonth =>
      totalRevenueInThisMonth.toInt().formatCurrency();

  String get getTotalRevenueOutThisMonth =>
      totalRevenueOutThisMonth.toInt().formatCurrency();

  String get getAllRevenueIn => allRevenueIn.toInt().formatCurrency();
  String get getAllRevenueOut => allRevenueOut.toInt().formatCurrency();

  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);
  Map<String, dynamic> toJson() => _$UserSessionToJson(this);
}
