import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_state.freezed.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    required bool isLoading,
    String? dataReceive,
    bool? isActive,
    List<String>? comPorts,
  }) = _SettingState;

  factory SettingState.initial() =>
      const SettingState(isLoading: false, comPorts: [], isActive: false);
}
