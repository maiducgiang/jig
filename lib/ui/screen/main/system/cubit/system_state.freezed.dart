// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'system_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SystemState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SystemStateCopyWith<SystemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemStateCopyWith<$Res> {
  factory $SystemStateCopyWith(
          SystemState value, $Res Function(SystemState) then) =
      _$SystemStateCopyWithImpl<$Res, SystemState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$SystemStateCopyWithImpl<$Res, $Val extends SystemState>
    implements $SystemStateCopyWith<$Res> {
  _$SystemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SystemStateCopyWith<$Res>
    implements $SystemStateCopyWith<$Res> {
  factory _$$_SystemStateCopyWith(
          _$_SystemState value, $Res Function(_$_SystemState) then) =
      __$$_SystemStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$_SystemStateCopyWithImpl<$Res>
    extends _$SystemStateCopyWithImpl<$Res, _$_SystemState>
    implements _$$_SystemStateCopyWith<$Res> {
  __$$_SystemStateCopyWithImpl(
      _$_SystemState _value, $Res Function(_$_SystemState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$_SystemState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SystemState implements _SystemState {
  const _$_SystemState({required this.isLoading});

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'SystemState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SystemState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SystemStateCopyWith<_$_SystemState> get copyWith =>
      __$$_SystemStateCopyWithImpl<_$_SystemState>(this, _$identity);
}

abstract class _SystemState implements SystemState {
  const factory _SystemState({required final bool isLoading}) = _$_SystemState;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_SystemStateCopyWith<_$_SystemState> get copyWith =>
      throw _privateConstructorUsedError;
}
