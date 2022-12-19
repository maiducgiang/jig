import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jig/data/enum/enum_test_status.dart';

part 'status_led_state.freezed.dart';

@freezed
class StatusLedState with _$StatusLedState {
  const factory StatusLedState(
      {required bool isLoading,
      ResultStatus? result,
      bool? isActive,
      String? error}) = _StatusLedState;

  factory StatusLedState.initial() => const StatusLedState(
      isLoading: false, isActive: false, error: "", result: ResultStatus.check);
}
