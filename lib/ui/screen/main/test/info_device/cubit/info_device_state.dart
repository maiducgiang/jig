import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jig/data/enum/enum_test_status.dart';

part 'info_device_state.freezed.dart';

@freezed
class InfoDeviceState with _$InfoDeviceState {
  const factory InfoDeviceState(
      {required bool isLoading,
      ResultStatus? result,
      bool? isActive,
      String? error}) = _InfoDeviceState;

  factory InfoDeviceState.initial() => const InfoDeviceState(
      isLoading: false, isActive: false, error: "", result: ResultStatus.check);
}
