import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jig/data/enum/enum_test_status.dart';

part 'voice_state.freezed.dart';

@freezed
class VoiceState with _$VoiceState {
  const factory VoiceState(
      {required bool isLoading,
      ResultStatus? result,
      bool? isActive,
      String? error}) = _VoiceState;

  factory VoiceState.initial() => const VoiceState(
      isLoading: false, isActive: false, error: "", result: ResultStatus.check);
}
