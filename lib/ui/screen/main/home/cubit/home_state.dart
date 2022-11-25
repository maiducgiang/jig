import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    String? dataReceive,
    bool? isActive,
    List<String>? comPorts,
  }) = _HomeState;

  factory HomeState.initial() =>
      const HomeState(isLoading: false, comPorts: [], isActive: false);
}
