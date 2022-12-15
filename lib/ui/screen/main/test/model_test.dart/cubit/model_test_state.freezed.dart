// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'model_test_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ModelTestState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool? get result => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ModelTestStateCopyWith<ModelTestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelTestStateCopyWith<$Res> {
  factory $ModelTestStateCopyWith(
          ModelTestState value, $Res Function(ModelTestState) then) =
      _$ModelTestStateCopyWithImpl<$Res, ModelTestState>;
  @useResult
  $Res call({bool isLoading, bool? result, bool? isActive, String? error});
}

/// @nodoc
class _$ModelTestStateCopyWithImpl<$Res, $Val extends ModelTestState>
    implements $ModelTestStateCopyWith<$Res> {
  _$ModelTestStateCopyWithImpl(this._value, this._then);

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
              as bool?,
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
abstract class _$$_ModelTestStateCopyWith<$Res>
    implements $ModelTestStateCopyWith<$Res> {
  factory _$$_ModelTestStateCopyWith(
          _$_ModelTestState value, $Res Function(_$_ModelTestState) then) =
      __$$_ModelTestStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool? result, bool? isActive, String? error});
}

/// @nodoc
class __$$_ModelTestStateCopyWithImpl<$Res>
    extends _$ModelTestStateCopyWithImpl<$Res, _$_ModelTestState>
    implements _$$_ModelTestStateCopyWith<$Res> {
  __$$_ModelTestStateCopyWithImpl(
      _$_ModelTestState _value, $Res Function(_$_ModelTestState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? result = freezed,
    Object? isActive = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_ModelTestState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool?,
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

class _$_ModelTestState implements _ModelTestState {
  const _$_ModelTestState(
      {required this.isLoading, this.result, this.isActive, this.error});

  @override
  final bool isLoading;
  @override
  final bool? result;
  @override
  final bool? isActive;
  @override
  final String? error;

  @override
  String toString() {
    return 'ModelTestState(isLoading: $isLoading, result: $result, isActive: $isActive, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ModelTestState &&
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
  _$$_ModelTestStateCopyWith<_$_ModelTestState> get copyWith =>
      __$$_ModelTestStateCopyWithImpl<_$_ModelTestState>(this, _$identity);
}

abstract class _ModelTestState implements ModelTestState {
  const factory _ModelTestState(
      {required final bool isLoading,
      final bool? result,
      final bool? isActive,
      final String? error}) = _$_ModelTestState;

  @override
  bool get isLoading;
  @override
  bool? get result;
  @override
  bool? get isActive;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_ModelTestStateCopyWith<_$_ModelTestState> get copyWith =>
      throw _privateConstructorUsedError;
}
