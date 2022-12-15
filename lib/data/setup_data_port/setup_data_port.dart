import 'package:freezed_annotation/freezed_annotation.dart';

part 'setup_data_port.g.dart';

@JsonSerializable()
class SetupDataPortModel {
  final String namePort;
  final int baudRate;
  final int parity;
  final int stopBits;
  final int byteSize;
  final int readIntervalTimeout;
  final int readTotalTimeoutConstant;
  final int readTotalTimeoutMulti;

  SetupDataPortModel(
      {required this.namePort,
      required this.baudRate,
      required this.byteSize,
      required this.parity,
      required this.readIntervalTimeout,
      required this.readTotalTimeoutConstant,
      required this.readTotalTimeoutMulti,
      required this.stopBits});
  factory SetupDataPortModel.fromJson(Map<String, dynamic> json) =>
      _$SetupDataPortModelFromJson(json);

  Map<String, dynamic> toJson() => _$SetupDataPortModelToJson(this);
}
