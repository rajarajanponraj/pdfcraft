// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plugin_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PluginSchema _$PluginSchemaFromJson(Map<String, dynamic> json) {
  return _PluginSchema.fromJson(json);
}

/// @nodoc
mixin _$PluginSchema {
  /// The unique name of the plugin (e.g., 'text', 'image').
  String get name => throw _privateConstructorUsedError;

  /// The version of the plugin used when the template was created.
  String get version => throw _privateConstructorUsedError;

  /// Serializes this PluginSchema to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PluginSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PluginSchemaCopyWith<PluginSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PluginSchemaCopyWith<$Res> {
  factory $PluginSchemaCopyWith(
          PluginSchema value, $Res Function(PluginSchema) then) =
      _$PluginSchemaCopyWithImpl<$Res, PluginSchema>;
  @useResult
  $Res call({String name, String version});
}

/// @nodoc
class _$PluginSchemaCopyWithImpl<$Res, $Val extends PluginSchema>
    implements $PluginSchemaCopyWith<$Res> {
  _$PluginSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PluginSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PluginSchemaImplCopyWith<$Res>
    implements $PluginSchemaCopyWith<$Res> {
  factory _$$PluginSchemaImplCopyWith(
          _$PluginSchemaImpl value, $Res Function(_$PluginSchemaImpl) then) =
      __$$PluginSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String version});
}

/// @nodoc
class __$$PluginSchemaImplCopyWithImpl<$Res>
    extends _$PluginSchemaCopyWithImpl<$Res, _$PluginSchemaImpl>
    implements _$$PluginSchemaImplCopyWith<$Res> {
  __$$PluginSchemaImplCopyWithImpl(
      _$PluginSchemaImpl _value, $Res Function(_$PluginSchemaImpl) _then)
      : super(_value, _then);

  /// Create a copy of PluginSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? version = null,
  }) {
    return _then(_$PluginSchemaImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PluginSchemaImpl implements _PluginSchema {
  const _$PluginSchemaImpl({required this.name, required this.version});

  factory _$PluginSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PluginSchemaImplFromJson(json);

  /// The unique name of the plugin (e.g., 'text', 'image').
  @override
  final String name;

  /// The version of the plugin used when the template was created.
  @override
  final String version;

  @override
  String toString() {
    return 'PluginSchema(name: $name, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PluginSchemaImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, version);

  /// Create a copy of PluginSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PluginSchemaImplCopyWith<_$PluginSchemaImpl> get copyWith =>
      __$$PluginSchemaImplCopyWithImpl<_$PluginSchemaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PluginSchemaImplToJson(
      this,
    );
  }
}

abstract class _PluginSchema implements PluginSchema {
  const factory _PluginSchema(
      {required final String name,
      required final String version}) = _$PluginSchemaImpl;

  factory _PluginSchema.fromJson(Map<String, dynamic> json) =
      _$PluginSchemaImpl.fromJson;

  /// The unique name of the plugin (e.g., 'text', 'image').
  @override
  String get name;

  /// The version of the plugin used when the template was created.
  @override
  String get version;

  /// Create a copy of PluginSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PluginSchemaImplCopyWith<_$PluginSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
