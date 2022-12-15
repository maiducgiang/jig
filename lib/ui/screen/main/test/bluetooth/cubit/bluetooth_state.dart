import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jig/data/enum/enum_test_status.dart';

part 'bluetooth_state.freezed.dart';

@freezed
class BluetoothState with _$BluetoothState {
  const factory BluetoothState(
      {required bool isLoading,
      ResultStatus? result,
      bool? isActive,
      String? error}) = _InfoDeviceState;

  factory BluetoothState.initial() => const BluetoothState(
      isLoading: false, isActive: false, error: "", result: ResultStatus.check);
}
