import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jig/data/enum/enum_test_status.dart';

part 'bluetooth_mac_state.freezed.dart';

@freezed
class BluetoothMacState with _$BluetoothMacState {
  const factory BluetoothMacState(
      {required bool isLoading,
      ResultStatus? result,
      bool? isActive,
      String? error}) = _BluetoothMacState;

  factory BluetoothMacState.initial() => const BluetoothMacState(
      isLoading: false, isActive: false, error: "", result: ResultStatus.check);
}
