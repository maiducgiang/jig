import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jig/data/enum/enum_test_status.dart';

part 'calib_power_state.freezed.dart';

@freezed
class CalibPowerState with _$CalibPowerState {
  const factory CalibPowerState(
      {required bool isLoading,
      ResultStatus? result,
      bool? isActive,
      String? error}) = _CalibPowerState;

  factory CalibPowerState.initial() => const CalibPowerState(
      isLoading: false, isActive: false, error: "", result: ResultStatus.check);
}
