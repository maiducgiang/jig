import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jig/data/model/user_session/user_session.dart';

part 'app_state.freezed.dart';

@immutable
@freezed
class AppState with _$AppState {
  const factory AppState({
    UserSession? userSession,
  }) = _AppState;
  factory AppState.initial() => const AppState(userSession: null);
}
