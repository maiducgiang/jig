import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_state.freezed.dart';

@freezed
class SigninState with _$SigninState {
  const factory SigninState({required bool isLoading, String? error}) =
      _SigninState;

  factory SigninState.initial() => const SigninState(
        isLoading: false,
      );
}
