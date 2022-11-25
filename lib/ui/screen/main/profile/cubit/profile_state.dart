import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required bool isLoading,

  }) = _ProfileState;

  factory ProfileState.initial() => const ProfileState(
        isLoading: false,

      );
}
