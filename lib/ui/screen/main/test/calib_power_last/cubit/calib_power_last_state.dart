import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jig/data/enum/enum_test_status.dart';

part 'calib_power_last_state.freezed.dart';

@freezed
class CalibPowerLastState with _$CalibPowerLastState {
  const factory CalibPowerLastState(
      {required bool isLoading,
      ResultStatus? result,
      bool? isActive,
      String? error}) = _CalibPowerLastState;

  factory CalibPowerLastState.initial() => const CalibPowerLastState(
      isLoading: false, isActive: false, error: "", result: ResultStatus.check);
}
