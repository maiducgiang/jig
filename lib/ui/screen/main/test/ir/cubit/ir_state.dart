import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jig/data/enum/enum_test_status.dart';

part 'ir_state.freezed.dart';

@freezed
class IrState with _$IrState {
  const factory IrState(
      {required bool isLoading,
      ResultStatus? result,
      bool? isActive,
      String? error}) = _InfoDeviceState;

  factory IrState.initial() => const IrState(
      isLoading: false, isActive: false, error: "", result: ResultStatus.check);
}
