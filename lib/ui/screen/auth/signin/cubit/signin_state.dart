import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jig/data/model/question/question_model.dart';
import 'package:jig/data/model/result/result_model.dart';

part 'signin_state.freezed.dart';

@freezed
class SigninState with _$SigninState {
  const factory SigninState({required bool isLoading, String? error}) =
      _SigninState;

  factory SigninState.initial() => const SigninState(
        isLoading: false,
      );
}
