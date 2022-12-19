// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'status_led_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StatusLedState {
  bool get isLoading => throw _privateConstructorUsedError;
  ResultStatus? get result => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatusLedStateCopyWith<StatusLedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusLedStateCopyWith<$Res> {
  factory $StatusLedStateCopyWith(
          StatusLedState value, $Res Function(StatusLedState) then) =
      _$StatusLedStateCopyWithImpl<$Res, StatusLedState>;
  @useResult
  $Res call(
      {bool isLoading, ResultStatus? result, bool? isActive, String? error});
}

/// @nodoc
class _$StatusLedStateCopyWithImpl<$Res, $Val extends StatusLedState>
    implements $StatusLedStateCopyWith<$Res> {
  _$StatusLedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? result = freezed,
    Object? isActive = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ResultStatus?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StatusLedStateCopyWith<$Res>
    implements $StatusLedStateCopyWith<$Res> {
  factory _$$_StatusLedStateCopyWith(
          _$_StatusLedState value, $Res Function(_$_StatusLedState) then) =
      __$$_StatusLedStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, ResultStatus? result, bool? isActive, String? error});
}

/// @nodoc
class __$$_StatusLedStateCopyWithImpl<$Res>
    extends _$StatusLedStateCopyWithImpl<$Res, _$_StatusLedState>
    implements _$$_StatusLedStateCopyWith<$Res> {
  __$$_StatusLedStateCopyWithImpl(
      _$_StatusLedState _value, $Res Function(_$_StatusLedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? result = freezed,
    Object? isActive = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_StatusLedState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ResultStatus?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_StatusLedState implements _StatusLedState {
  const _$_StatusLedState(
      {required this.isLoading, this.result, this.isActive, this.error});

  @override
  final bool isLoading;
  @override
  final ResultStatus? result;
  @override
  final bool? isActive;
  @override
  final String? error;

  @override
  String toString() {
    return 'StatusLedState(isLoading: $isLoading, result: $result, isActive: $isActive, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatusLedState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, result, isActive, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatusLedStateCopyWith<_$_StatusLedState> get copyWith =>
      __$$_StatusLedStateCopyWithImpl<_$_StatusLedState>(this, _$identity);
}

abstract class _StatusLedState implements StatusLedState {
  const factory _StatusLedState(
      {required final bool isLoading,
      final ResultStatus? result,
      final bool? isActive,
      final String? error}) = _$_StatusLedState;

  @override
  bool get isLoading;
  @override
  ResultStatus? get result;
  @override
  bool? get isActive;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_StatusLedStateCopyWith<_$_StatusLedState> get copyWith =>
      throw _privateConstructorUsedError;
}
