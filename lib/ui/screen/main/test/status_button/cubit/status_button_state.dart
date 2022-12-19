import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jig/data/enum/enum_test_status.dart';

part 'status_button_state.freezed.dart';

@freezed
class StatusButtonState with _$StatusButtonState {
  const factory StatusButtonState(
      {required bool isLoading,
      ResultStatus? result,
      bool? isActive,
      String? error}) = _StatusButtonState;

  factory StatusButtonState.initial() => const StatusButtonState(
      isLoading: false, isActive: false, error: "", result: ResultStatus.check);
}
