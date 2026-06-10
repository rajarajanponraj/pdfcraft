// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PageSchema _$PageSchemaFromJson(Map<String, dynamic> json) {
  return _PageSchema.fromJson(json);
}

/// @nodoc
mixin _$PageSchema {
  /// Unique identifier for the page.
  String get id => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  List<FieldSchema> get fields => throw _privateConstructorUsedError;

  /// Optional styling for the page background.
  StyleSchema? get style => throw _privateConstructorUsedError;

  /// Serializes this PageSchema to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PageSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageSchemaCopyWith<PageSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageSchemaCopyWith<$Res> {
  factory $PageSchemaCopyWith(
          PageSchema value, $Res Function(PageSchema) then) =
      _$PageSchemaCopyWithImpl<$Res, PageSchema>;
  @useResult
  $Res call(
      {String id,
      double width,
      double height,
      List<FieldSchema> fields,
      StyleSchema? style});

  $StyleSchemaCopyWith<$Res>? get style;
}

/// @nodoc
class _$PageSchemaCopyWithImpl<$Res, $Val extends PageSchema>
    implements $PageSchemaCopyWith<$Res> {
  _$PageSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? width = null,
    Object? height = null,
    Object? fields = null,
    Object? style = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<FieldSchema>,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as StyleSchema?,
    ) as $Val);
  }

  /// Create a copy of PageSchema
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
abstract class _$$PageSchemaImplCopyWith<$Res>
    implements $PageSchemaCopyWith<$Res> {
  factory _$$PageSchemaImplCopyWith(
          _$PageSchemaImpl value, $Res Function(_$PageSchemaImpl) then) =
      __$$PageSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double width,
      double height,
      List<FieldSchema> fields,
      StyleSchema? style});

  @override
  $StyleSchemaCopyWith<$Res>? get style;
}

/// @nodoc
class __$$PageSchemaImplCopyWithImpl<$Res>
    extends _$PageSchemaCopyWithImpl<$Res, _$PageSchemaImpl>
    implements _$$PageSchemaImplCopyWith<$Res> {
  __$$PageSchemaImplCopyWithImpl(
      _$PageSchemaImpl _value, $Res Function(_$PageSchemaImpl) _then)
      : super(_value, _then);

  /// Create a copy of PageSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? width = null,
    Object? height = null,
    Object? fields = null,
    Object? style = freezed,
  }) {
    return _then(_$PageSchemaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<FieldSchema>,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as StyleSchema?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageSchemaImpl implements _PageSchema {
  const _$PageSchemaImpl(
      {required this.id,
      required this.width,
      required this.height,
      final List<FieldSchema> fields = const [],
      this.style})
      : _fields = fields;

  factory _$PageSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageSchemaImplFromJson(json);

  /// Unique identifier for the page.
  @override
  final String id;
  @override
  final double width;
  @override
  final double height;
  final List<FieldSchema> _fields;
  @override
  @JsonKey()
  List<FieldSchema> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  /// Optional styling for the page background.
  @override
  final StyleSchema? style;

  @override
  String toString() {
    return 'PageSchema(id: $id, width: $width, height: $height, fields: $fields, style: $style)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageSchemaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            const DeepCollectionEquality().equals(other._fields, _fields) &&
            (identical(other.style, style) || other.style == style));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, width, height,
      const DeepCollectionEquality().hash(_fields), style);

  /// Create a copy of PageSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageSchemaImplCopyWith<_$PageSchemaImpl> get copyWith =>
      __$$PageSchemaImplCopyWithImpl<_$PageSchemaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageSchemaImplToJson(
      this,
    );
  }
}

abstract class _PageSchema implements PageSchema {
  const factory _PageSchema(
      {required final String id,
      required final double width,
      required final double height,
      final List<FieldSchema> fields,
      final StyleSchema? style}) = _$PageSchemaImpl;

  factory _PageSchema.fromJson(Map<String, dynamic> json) =
      _$PageSchemaImpl.fromJson;

  /// Unique identifier for the page.
  @override
  String get id;
  @override
  double get width;
  @override
  double get height;
  @override
  List<FieldSchema> get fields;

  /// Optional styling for the page background.
  @override
  StyleSchema? get style;

  /// Create a copy of PageSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageSchemaImplCopyWith<_$PageSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
