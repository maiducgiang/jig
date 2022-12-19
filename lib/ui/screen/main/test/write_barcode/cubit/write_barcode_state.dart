import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jig/data/enum/enum_test_status.dart';

part 'write_barcode_state.freezed.dart';

@freezed
class WriteBarcodeState with _$WriteBarcodeState {
  const factory WriteBarcodeState(
      {required bool isLoading,
      ResultStatus? result,
      bool? isActive,
      String? error}) = _WriteBarcodeState;

  factory WriteBarcodeState.initial() => const WriteBarcodeState(
      isLoading: false, isActive: false, error: "", result: ResultStatus.check);
}
