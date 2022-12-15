import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_test_state.freezed.dart';

@freezed
class ModelTestState with _$ModelTestState {
  const factory ModelTestState(
      {required bool isLoading,
      bool? result,
      bool? isActive,
      String? error}) = _ModelTestState;

  factory ModelTestState.initial() =>
      const ModelTestState(isLoading: false, isActive: false, error: "");
}
