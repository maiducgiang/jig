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

  SetupDataPortModel copyWith(
    String? namePort,
    int? baudRate,
    int? parity,
    int? stopBits,
    int? byteSize,
    int? readIntervalTimeout,
    int? readTotalTimeoutConstant,
    int? readTotalTimeoutMulti,
  ) {
    return SetupDataPortModel(
      namePort: namePort ?? this.namePort,
      baudRate: baudRate ?? this.baudRate,
      parity: parity ?? this.parity,
      stopBits: stopBits ?? this.stopBits,
      byteSize: byteSize ?? this.byteSize,
      readIntervalTimeout: readIntervalTimeout ?? this.readIntervalTimeout,
      readTotalTimeoutConstant:
          readTotalTimeoutConstant ?? this.readTotalTimeoutConstant,
      readTotalTimeoutMulti:
          readTotalTimeoutMulti ?? this.readTotalTimeoutMulti,
    );
  }
}
