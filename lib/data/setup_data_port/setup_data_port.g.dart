// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup_data_port.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetupDataPortModel _$SetupDataPortModelFromJson(Map<String, dynamic> json) =>
    SetupDataPortModel(
      namePort: json['namePort'] as String,
      baudRate: json['baudRate'] as int,
      byteSize: json['byteSize'] as int,
      parity: json['parity'] as int,
      readIntervalTimeout: json['readIntervalTimeout'] as int,
      readTotalTimeoutConstant: json['readTotalTimeoutConstant'] as int,
      readTotalTimeoutMulti: json['readTotalTimeoutMulti'] as int,
      stopBits: json['stopBits'] as int,
    );

Map<String, dynamic> _$SetupDataPortModelToJson(SetupDataPortModel instance) =>
    <String, dynamic>{
      'namePort': instance.namePort,
      'baudRate': instance.baudRate,
      'parity': instance.parity,
      'stopBits': instance.stopBits,
      'byteSize': instance.byteSize,
      'readIntervalTimeout': instance.readIntervalTimeout,
      'readTotalTimeoutConstant': instance.readTotalTimeoutConstant,
      'readTotalTimeoutMulti': instance.readTotalTimeoutMulti,
    };
