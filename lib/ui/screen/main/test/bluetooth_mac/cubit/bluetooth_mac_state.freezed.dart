// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bluetooth_mac_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BluetoothMacState {
  bool get isLoading => throw _privateConstructorUsedError;
  ResultStatus? get result => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BluetoothMacStateCopyWith<BluetoothMacState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothMacStateCopyWith<$Res> {
  factory $BluetoothMacStateCopyWith(
          BluetoothMacState value, $Res Function(BluetoothMacState) then) =
      _$BluetoothMacStateCopyWithImpl<$Res, BluetoothMacState>;
  @useResult
  $Res call(
      {bool isLoading, ResultStatus? result, bool? isActive, String? error});
}

/// @nodoc
class _$BluetoothMacStateCopyWithImpl<$Res, $Val extends BluetoothMacState>
    implements $BluetoothMacStateCopyWith<$Res> {
  _$BluetoothMacStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_BluetoothMacStateCopyWith<$Res>
    implements $BluetoothMacStateCopyWith<$Res> {
  factory _$$_BluetoothMacStateCopyWith(_$_BluetoothMacState value,
          $Res Function(_$_BluetoothMacState) then) =
      __$$_BluetoothMacStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, ResultStatus? result, bool? isActive, String? error});
}

/// @nodoc
class __$$_BluetoothMacStateCopyWithImpl<$Res>
    extends _$BluetoothMacStateCopyWithImpl<$Res, _$_BluetoothMacState>
    implements _$$_BluetoothMacStateCopyWith<$Res> {
  __$$_BluetoothMacStateCopyWithImpl(
      _$_BluetoothMacState _value, $Res Function(_$_BluetoothMacState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? result = freezed,
    Object? isActive = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_BluetoothMacState(
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

class _$_BluetoothMacState implements _BluetoothMacState {
  const _$_BluetoothMacState(
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
    return 'BluetoothMacState(isLoading: $isLoading, result: $result, isActive: $isActive, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BluetoothMacState &&
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
  _$$_BluetoothMacStateCopyWith<_$_BluetoothMacState> get copyWith =>
      __$$_BluetoothMacStateCopyWithImpl<_$_BluetoothMacState>(
          this, _$identity);
}

abstract class _BluetoothMacState implements BluetoothMacState {
  const factory _BluetoothMacState(
      {required final bool isLoading,
      final ResultStatus? result,
      final bool? isActive,
      final String? error}) = _$_BluetoothMacState;

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
  _$$_BluetoothMacStateCopyWith<_$_BluetoothMacState> get copyWith =>
      throw _privateConstructorUsedError;
}
