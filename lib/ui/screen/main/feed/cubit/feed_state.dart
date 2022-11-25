import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_state.freezed.dart';

@freezed
class FeedState with _$FeedState {
  const factory FeedState(
      {required bool isLoading,
      }) = _FeedState;

  factory FeedState.initial() =>
      const FeedState(isLoading: false,);
}
