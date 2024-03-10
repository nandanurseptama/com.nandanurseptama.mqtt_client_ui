// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pubsub_client_connection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PubsubClientConnectionState {
  PubsubClientConfig? get config => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PubsubClientConfig config) prepared,
    required TResult Function(PubsubClientConfig config) connected,
    required TResult Function(PubsubClientConfig config) connecting,
    required TResult Function(PubsubClientConfig? config) disconnected,
    required TResult Function(PubsubClientConfig? config, String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PubsubClientConfig config)? prepared,
    TResult? Function(PubsubClientConfig config)? connected,
    TResult? Function(PubsubClientConfig config)? connecting,
    TResult? Function(PubsubClientConfig? config)? disconnected,
    TResult? Function(PubsubClientConfig? config, String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PubsubClientConfig config)? prepared,
    TResult Function(PubsubClientConfig config)? connected,
    TResult Function(PubsubClientConfig config)? connecting,
    TResult Function(PubsubClientConfig? config)? disconnected,
    TResult Function(PubsubClientConfig? config, String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Prepared value) prepared,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Prepared value)? prepared,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Prepared value)? prepared,
    TResult Function(_Connected value)? connected,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PubsubClientConnectionStateCopyWith<PubsubClientConnectionState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PubsubClientConnectionStateCopyWith<$Res> {
  factory $PubsubClientConnectionStateCopyWith(
          PubsubClientConnectionState value,
          $Res Function(PubsubClientConnectionState) then) =
      _$PubsubClientConnectionStateCopyWithImpl<$Res,
          PubsubClientConnectionState>;
  @useResult
  $Res call({PubsubClientConfig config});
}

/// @nodoc
class _$PubsubClientConnectionStateCopyWithImpl<$Res,
        $Val extends PubsubClientConnectionState>
    implements $PubsubClientConnectionStateCopyWith<$Res> {
  _$PubsubClientConnectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_value.copyWith(
      config: null == config
          ? _value.config!
          : config // ignore: cast_nullable_to_non_nullable
              as PubsubClientConfig,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreparedImplCopyWith<$Res>
    implements $PubsubClientConnectionStateCopyWith<$Res> {
  factory _$$PreparedImplCopyWith(
          _$PreparedImpl value, $Res Function(_$PreparedImpl) then) =
      __$$PreparedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PubsubClientConfig config});
}

/// @nodoc
class __$$PreparedImplCopyWithImpl<$Res>
    extends _$PubsubClientConnectionStateCopyWithImpl<$Res, _$PreparedImpl>
    implements _$$PreparedImplCopyWith<$Res> {
  __$$PreparedImplCopyWithImpl(
      _$PreparedImpl _value, $Res Function(_$PreparedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$PreparedImpl(
      null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as PubsubClientConfig,
    ));
  }
}

/// @nodoc

class _$PreparedImpl implements _Prepared {
  const _$PreparedImpl(this.config);

  @override
  final PubsubClientConfig config;

  @override
  String toString() {
    return 'PubsubClientConnectionState.prepared(config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreparedImpl &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreparedImplCopyWith<_$PreparedImpl> get copyWith =>
      __$$PreparedImplCopyWithImpl<_$PreparedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PubsubClientConfig config) prepared,
    required TResult Function(PubsubClientConfig config) connected,
    required TResult Function(PubsubClientConfig config) connecting,
    required TResult Function(PubsubClientConfig? config) disconnected,
    required TResult Function(PubsubClientConfig? config, String error) error,
  }) {
    return prepared(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PubsubClientConfig config)? prepared,
    TResult? Function(PubsubClientConfig config)? connected,
    TResult? Function(PubsubClientConfig config)? connecting,
    TResult? Function(PubsubClientConfig? config)? disconnected,
    TResult? Function(PubsubClientConfig? config, String error)? error,
  }) {
    return prepared?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PubsubClientConfig config)? prepared,
    TResult Function(PubsubClientConfig config)? connected,
    TResult Function(PubsubClientConfig config)? connecting,
    TResult Function(PubsubClientConfig? config)? disconnected,
    TResult Function(PubsubClientConfig? config, String error)? error,
    required TResult orElse(),
  }) {
    if (prepared != null) {
      return prepared(config);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Prepared value) prepared,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Error value) error,
  }) {
    return prepared(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Prepared value)? prepared,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Error value)? error,
  }) {
    return prepared?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Prepared value)? prepared,
    TResult Function(_Connected value)? connected,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (prepared != null) {
      return prepared(this);
    }
    return orElse();
  }
}

abstract class _Prepared implements PubsubClientConnectionState {
  const factory _Prepared(final PubsubClientConfig config) = _$PreparedImpl;

  @override
  PubsubClientConfig get config;
  @override
  @JsonKey(ignore: true)
  _$$PreparedImplCopyWith<_$PreparedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectedImplCopyWith<$Res>
    implements $PubsubClientConnectionStateCopyWith<$Res> {
  factory _$$ConnectedImplCopyWith(
          _$ConnectedImpl value, $Res Function(_$ConnectedImpl) then) =
      __$$ConnectedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PubsubClientConfig config});
}

/// @nodoc
class __$$ConnectedImplCopyWithImpl<$Res>
    extends _$PubsubClientConnectionStateCopyWithImpl<$Res, _$ConnectedImpl>
    implements _$$ConnectedImplCopyWith<$Res> {
  __$$ConnectedImplCopyWithImpl(
      _$ConnectedImpl _value, $Res Function(_$ConnectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$ConnectedImpl(
      null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as PubsubClientConfig,
    ));
  }
}

/// @nodoc

class _$ConnectedImpl implements _Connected {
  const _$ConnectedImpl(this.config);

  @override
  final PubsubClientConfig config;

  @override
  String toString() {
    return 'PubsubClientConnectionState.connected(config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectedImpl &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectedImplCopyWith<_$ConnectedImpl> get copyWith =>
      __$$ConnectedImplCopyWithImpl<_$ConnectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PubsubClientConfig config) prepared,
    required TResult Function(PubsubClientConfig config) connected,
    required TResult Function(PubsubClientConfig config) connecting,
    required TResult Function(PubsubClientConfig? config) disconnected,
    required TResult Function(PubsubClientConfig? config, String error) error,
  }) {
    return connected(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PubsubClientConfig config)? prepared,
    TResult? Function(PubsubClientConfig config)? connected,
    TResult? Function(PubsubClientConfig config)? connecting,
    TResult? Function(PubsubClientConfig? config)? disconnected,
    TResult? Function(PubsubClientConfig? config, String error)? error,
  }) {
    return connected?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PubsubClientConfig config)? prepared,
    TResult Function(PubsubClientConfig config)? connected,
    TResult Function(PubsubClientConfig config)? connecting,
    TResult Function(PubsubClientConfig? config)? disconnected,
    TResult Function(PubsubClientConfig? config, String error)? error,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(config);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Prepared value) prepared,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Error value) error,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Prepared value)? prepared,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Error value)? error,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Prepared value)? prepared,
    TResult Function(_Connected value)? connected,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class _Connected implements PubsubClientConnectionState {
  const factory _Connected(final PubsubClientConfig config) = _$ConnectedImpl;

  @override
  PubsubClientConfig get config;
  @override
  @JsonKey(ignore: true)
  _$$ConnectedImplCopyWith<_$ConnectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectingImplCopyWith<$Res>
    implements $PubsubClientConnectionStateCopyWith<$Res> {
  factory _$$ConnectingImplCopyWith(
          _$ConnectingImpl value, $Res Function(_$ConnectingImpl) then) =
      __$$ConnectingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PubsubClientConfig config});
}

/// @nodoc
class __$$ConnectingImplCopyWithImpl<$Res>
    extends _$PubsubClientConnectionStateCopyWithImpl<$Res, _$ConnectingImpl>
    implements _$$ConnectingImplCopyWith<$Res> {
  __$$ConnectingImplCopyWithImpl(
      _$ConnectingImpl _value, $Res Function(_$ConnectingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
  }) {
    return _then(_$ConnectingImpl(
      null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as PubsubClientConfig,
    ));
  }
}

/// @nodoc

class _$ConnectingImpl implements _Connecting {
  const _$ConnectingImpl(this.config);

  @override
  final PubsubClientConfig config;

  @override
  String toString() {
    return 'PubsubClientConnectionState.connecting(config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectingImpl &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectingImplCopyWith<_$ConnectingImpl> get copyWith =>
      __$$ConnectingImplCopyWithImpl<_$ConnectingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PubsubClientConfig config) prepared,
    required TResult Function(PubsubClientConfig config) connected,
    required TResult Function(PubsubClientConfig config) connecting,
    required TResult Function(PubsubClientConfig? config) disconnected,
    required TResult Function(PubsubClientConfig? config, String error) error,
  }) {
    return connecting(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PubsubClientConfig config)? prepared,
    TResult? Function(PubsubClientConfig config)? connected,
    TResult? Function(PubsubClientConfig config)? connecting,
    TResult? Function(PubsubClientConfig? config)? disconnected,
    TResult? Function(PubsubClientConfig? config, String error)? error,
  }) {
    return connecting?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PubsubClientConfig config)? prepared,
    TResult Function(PubsubClientConfig config)? connected,
    TResult Function(PubsubClientConfig config)? connecting,
    TResult Function(PubsubClientConfig? config)? disconnected,
    TResult Function(PubsubClientConfig? config, String error)? error,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(config);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Prepared value) prepared,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Error value) error,
  }) {
    return connecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Prepared value)? prepared,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Error value)? error,
  }) {
    return connecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Prepared value)? prepared,
    TResult Function(_Connected value)? connected,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (connecting != null) {
      return connecting(this);
    }
    return orElse();
  }
}

abstract class _Connecting implements PubsubClientConnectionState {
  const factory _Connecting(final PubsubClientConfig config) = _$ConnectingImpl;

  @override
  PubsubClientConfig get config;
  @override
  @JsonKey(ignore: true)
  _$$ConnectingImplCopyWith<_$ConnectingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisconnectedImplCopyWith<$Res>
    implements $PubsubClientConnectionStateCopyWith<$Res> {
  factory _$$DisconnectedImplCopyWith(
          _$DisconnectedImpl value, $Res Function(_$DisconnectedImpl) then) =
      __$$DisconnectedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PubsubClientConfig? config});
}

/// @nodoc
class __$$DisconnectedImplCopyWithImpl<$Res>
    extends _$PubsubClientConnectionStateCopyWithImpl<$Res, _$DisconnectedImpl>
    implements _$$DisconnectedImplCopyWith<$Res> {
  __$$DisconnectedImplCopyWithImpl(
      _$DisconnectedImpl _value, $Res Function(_$DisconnectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = freezed,
  }) {
    return _then(_$DisconnectedImpl(
      config: freezed == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as PubsubClientConfig?,
    ));
  }
}

/// @nodoc

class _$DisconnectedImpl implements _Disconnected {
  const _$DisconnectedImpl({this.config = null});

  @override
  @JsonKey()
  final PubsubClientConfig? config;

  @override
  String toString() {
    return 'PubsubClientConnectionState.disconnected(config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisconnectedImpl &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisconnectedImplCopyWith<_$DisconnectedImpl> get copyWith =>
      __$$DisconnectedImplCopyWithImpl<_$DisconnectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PubsubClientConfig config) prepared,
    required TResult Function(PubsubClientConfig config) connected,
    required TResult Function(PubsubClientConfig config) connecting,
    required TResult Function(PubsubClientConfig? config) disconnected,
    required TResult Function(PubsubClientConfig? config, String error) error,
  }) {
    return disconnected(config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PubsubClientConfig config)? prepared,
    TResult? Function(PubsubClientConfig config)? connected,
    TResult? Function(PubsubClientConfig config)? connecting,
    TResult? Function(PubsubClientConfig? config)? disconnected,
    TResult? Function(PubsubClientConfig? config, String error)? error,
  }) {
    return disconnected?.call(config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PubsubClientConfig config)? prepared,
    TResult Function(PubsubClientConfig config)? connected,
    TResult Function(PubsubClientConfig config)? connecting,
    TResult Function(PubsubClientConfig? config)? disconnected,
    TResult Function(PubsubClientConfig? config, String error)? error,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(config);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Prepared value) prepared,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Error value) error,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Prepared value)? prepared,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Error value)? error,
  }) {
    return disconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Prepared value)? prepared,
    TResult Function(_Connected value)? connected,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class _Disconnected implements PubsubClientConnectionState {
  const factory _Disconnected({final PubsubClientConfig? config}) =
      _$DisconnectedImpl;

  @override
  PubsubClientConfig? get config;
  @override
  @JsonKey(ignore: true)
  _$$DisconnectedImplCopyWith<_$DisconnectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $PubsubClientConnectionStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PubsubClientConfig? config, String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$PubsubClientConnectionStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = freezed,
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      config: freezed == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as PubsubClientConfig?,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({this.config = null, required this.error});

  @override
  @JsonKey()
  final PubsubClientConfig? config;
  @override
  final String error;

  @override
  String toString() {
    return 'PubsubClientConnectionState.error(config: $config, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, config, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PubsubClientConfig config) prepared,
    required TResult Function(PubsubClientConfig config) connected,
    required TResult Function(PubsubClientConfig config) connecting,
    required TResult Function(PubsubClientConfig? config) disconnected,
    required TResult Function(PubsubClientConfig? config, String error) error,
  }) {
    return error(config, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PubsubClientConfig config)? prepared,
    TResult? Function(PubsubClientConfig config)? connected,
    TResult? Function(PubsubClientConfig config)? connecting,
    TResult? Function(PubsubClientConfig? config)? disconnected,
    TResult? Function(PubsubClientConfig? config, String error)? error,
  }) {
    return error?.call(config, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PubsubClientConfig config)? prepared,
    TResult Function(PubsubClientConfig config)? connected,
    TResult Function(PubsubClientConfig config)? connecting,
    TResult Function(PubsubClientConfig? config)? disconnected,
    TResult Function(PubsubClientConfig? config, String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(config, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Prepared value) prepared,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Disconnected value) disconnected,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Prepared value)? prepared,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Disconnected value)? disconnected,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Prepared value)? prepared,
    TResult Function(_Connected value)? connected,
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Disconnected value)? disconnected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PubsubClientConnectionState {
  const factory _Error(
      {final PubsubClientConfig? config,
      required final String error}) = _$ErrorImpl;

  @override
  PubsubClientConfig? get config;
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
