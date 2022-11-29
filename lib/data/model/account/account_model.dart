import 'package:json_annotation/json_annotation.dart';
part 'account_model.g.dart';

@JsonSerializable()
class Account {
  final String? email;
  final String? password;
  final String? type;
  final String? token;
  final int? userId;
  Account({this.email, this.type, this.password, this.token, this.userId});
  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}

@JsonSerializable()
class AccountRequest {
  final String? email;
  final String? password;

  AccountRequest({
    this.email,
    this.password,
  });
  factory AccountRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AccountRequestToJson(this);
}

@JsonSerializable()
class AccountResponse {
  final int? code;
  final String? message;
  final Account? data;
  AccountResponse({this.code, this.data, this.message});
  factory AccountResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AccountResponseToJson(this);
}
