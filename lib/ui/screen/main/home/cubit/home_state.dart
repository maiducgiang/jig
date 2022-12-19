import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jig/data/model/question/question_model.dart';
import 'package:jig/data/model/result/result_model.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState(
      {required bool isLoading,
      List<Question>? listQuestion,
      List<ResultModel>? results,
      String? error}) = _HomeState;

  factory HomeState.initial() => HomeState(
        isLoading: false,
      );
}
