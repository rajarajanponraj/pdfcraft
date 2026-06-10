// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FieldSchema _$FieldSchemaFromJson(Map<String, dynamic> json) {
  return _FieldSchema.fromJson(json);
}

/// @nodoc
mixin _$FieldSchema {
  /// Unique identifier for the field.
  String get id => throw _privateConstructorUsedError;

  /// Type of the field, corresponding to a registered plugin name.
  String get type => throw _privateConstructorUsedError;
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;

  /// Plugin-specific data.
  Map<String, dynamic> get data => throw _privateConstructorUsedError;

  /// Common styling properties.
  StyleSchema? get style => throw _privateConstructorUsedError;

  /// Serializes this FieldSchema to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FieldSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FieldSchemaCopyWith<FieldSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldSchemaCopyWith<$Res> {
  factory $FieldSchemaCopyWith(
          FieldSchema value, $Res Function(FieldSchema) then) =
      _$FieldSchemaCopyWithImpl<$Res, FieldSchema>;
  @useResult
  $Res call(
      {String id,
      String type,
      double x,
      double y,
      double width,
      double height,
      Map<String, dynamic> data,
      StyleSchema? style});

  $StyleSchemaCopyWith<$Res>? get style;
}

/// @nodoc
class _$FieldSchemaCopyWithImpl<$Res, $Val extends FieldSchema>
    implements $FieldSchemaCopyWith<$Res> {
  _$FieldSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FieldSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? x = null,
    Object? y = null,
    Object? width = null,
    Object? height = null,
    Object? data = null,
    Object? style = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as StyleSchema?,
    ) as $Val);
  }

  /// Create a copy of FieldSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StyleSchemaCopyWith<$Res>? get style {
    if (_value.style == null) {
      return null;
    }

    return $StyleSchemaCopyWith<$Res>(_value.style!, (value) {
      return _then(_value.copyWith(style: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FieldSchemaImplCopyWith<$Res>
    implements $FieldSchemaCopyWith<$Res> {
  factory _$$FieldSchemaImplCopyWith(
          _$FieldSchemaImpl value, $Res Function(_$FieldSchemaImpl) then) =
      __$$FieldSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      double x,
      double y,
      double width,
      double height,
      Map<String, dynamic> data,
      StyleSchema? style});

  @override
  $StyleSchemaCopyWith<$Res>? get style;
}

/// @nodoc
class __$$FieldSchemaImplCopyWithImpl<$Res>
    extends _$FieldSchemaCopyWithImpl<$Res, _$FieldSchemaImpl>
    implements _$$FieldSchemaImplCopyWith<$Res> {
  __$$FieldSchemaImplCopyWithImpl(
      _$FieldSchemaImpl _value, $Res Function(_$FieldSchemaImpl) _then)
      : super(_value, _then);

  /// Create a copy of FieldSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? x = null,
    Object? y = null,
    Object? width = null,
    Object? height = null,
    Object? data = null,
    Object? style = freezed,
  }) {
    return _then(_$FieldSchemaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as StyleSchema?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FieldSchemaImpl implements _FieldSchema {
  const _$FieldSchemaImpl(
      {required this.id,
      required this.type,
      required this.x,
      required this.y,
      required this.width,
      required this.height,
      required final Map<String, dynamic> data,
      this.style})
      : _data = data;

  factory _$FieldSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$FieldSchemaImplFromJson(json);

  /// Unique identifier for the field.
  @override
  final String id;

  /// Type of the field, corresponding to a registered plugin name.
  @override
  final String type;
  @override
  final double x;
  @override
  final double y;
  @override
  final double width;
  @override
  final double height;

  /// Plugin-specific data.
  final Map<String, dynamic> _data;

  /// Plugin-specific data.
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  /// Common styling properties.
  @override
  final StyleSchema? style;

  @override
  String toString() {
    return 'FieldSchema(id: $id, type: $type, x: $x, y: $y, width: $width, height: $height, data: $data, style: $style)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldSchemaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.style, style) || other.style == style));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, x, y, width, height,
      const DeepCollectionEquality().hash(_data), style);

  /// Create a copy of FieldSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldSchemaImplCopyWith<_$FieldSchemaImpl> get copyWith =>
      __$$FieldSchemaImplCopyWithImpl<_$FieldSchemaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FieldSchemaImplToJson(
      this,
    );
  }
}

abstract class _FieldSchema implements FieldSchema {
  const factory _FieldSchema(
      {required final String id,
      required final String type,
      required final double x,
      required final double y,
      required final double width,
      required final double height,
      required final Map<String, dynamic> data,
      final StyleSchema? style}) = _$FieldSchemaImpl;

  factory _FieldSchema.fromJson(Map<String, dynamic> json) =
      _$FieldSchemaImpl.fromJson;

  /// Unique identifier for the field.
  @override
  String get id;

  /// Type of the field, corresponding to a registered plugin name.
  @override
  String get type;
  @override
  double get x;
  @override
  double get y;
  @override
  double get width;
  @override
  double get height;

  /// Plugin-specific data.
  @override
  Map<String, dynamic> get data;

  /// Common styling properties.
  @override
  StyleSchema? get style;

  /// Create a copy of FieldSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FieldSchemaImplCopyWith<_$FieldSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
