import 'package:json_annotation/json_annotation.dart';
part 'account_model.g.dart';

@JsonSerializable()
class Account {
  @JsonKey(name: '_id')
  final String id;

  final String? phone;
  final String? password;
  final String? type;


  Account(
      {required this.id,

      this.phone,
      this.type,
      this.password,
    });
  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
