// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Template _$TemplateFromJson(Map<String, dynamic> json) {
  return _Template.fromJson(json);
}

/// @nodoc
mixin _$Template {
  /// Version of the schema used to generate this template.
  String get version => throw _privateConstructorUsedError;

  /// Ordered list of pages in the template.
  List<PageSchema> get pages => throw _privateConstructorUsedError;

  /// List of plugins required to render this template.
  List<PluginSchema> get plugins => throw _privateConstructorUsedError;

  /// Serializes this Template to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Template
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TemplateCopyWith<Template> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateCopyWith<$Res> {
  factory $TemplateCopyWith(Template value, $Res Function(Template) then) =
      _$TemplateCopyWithImpl<$Res, Template>;
  @useResult
  $Res call(
      {String version, List<PageSchema> pages, List<PluginSchema> plugins});
}

/// @nodoc
class _$TemplateCopyWithImpl<$Res, $Val extends Template>
    implements $TemplateCopyWith<$Res> {
  _$TemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Template
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? pages = null,
    Object? plugins = null,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<PageSchema>,
      plugins: null == plugins
          ? _value.plugins
          : plugins // ignore: cast_nullable_to_non_nullable
              as List<PluginSchema>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemplateImplCopyWith<$Res>
    implements $TemplateCopyWith<$Res> {
  factory _$$TemplateImplCopyWith(
          _$TemplateImpl value, $Res Function(_$TemplateImpl) then) =
      __$$TemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String version, List<PageSchema> pages, List<PluginSchema> plugins});
}

/// @nodoc
class __$$TemplateImplCopyWithImpl<$Res>
    extends _$TemplateCopyWithImpl<$Res, _$TemplateImpl>
    implements _$$TemplateImplCopyWith<$Res> {
  __$$TemplateImplCopyWithImpl(
      _$TemplateImpl _value, $Res Function(_$TemplateImpl) _then)
      : super(_value, _then);

  /// Create a copy of Template
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? pages = null,
    Object? plugins = null,
  }) {
    return _then(_$TemplateImpl(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      pages: null == pages
          ? _value._pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<PageSchema>,
      plugins: null == plugins
          ? _value._plugins
          : plugins // ignore: cast_nullable_to_non_nullable
              as List<PluginSchema>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplateImpl implements _Template {
  const _$TemplateImpl(
      {required this.version,
      final List<PageSchema> pages = const [],
      final List<PluginSchema> plugins = const []})
      : _pages = pages,
        _plugins = plugins;

  factory _$TemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemplateImplFromJson(json);

  /// Version of the schema used to generate this template.
  @override
  final String version;

  /// Ordered list of pages in the template.
  final List<PageSchema> _pages;

  /// Ordered list of pages in the template.
  @override
  @JsonKey()
  List<PageSchema> get pages {
    if (_pages is EqualUnmodifiableListView) return _pages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pages);
  }

  /// List of plugins required to render this template.
  final List<PluginSchema> _plugins;

  /// List of plugins required to render this template.
  @override
  @JsonKey()
  List<PluginSchema> get plugins {
    if (_plugins is EqualUnmodifiableListView) return _plugins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plugins);
  }

  @override
  String toString() {
    return 'Template(version: $version, pages: $pages, plugins: $plugins)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateImpl &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other._pages, _pages) &&
            const DeepCollectionEquality().equals(other._plugins, _plugins));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      version,
      const DeepCollectionEquality().hash(_pages),
      const DeepCollectionEquality().hash(_plugins));

  /// Create a copy of Template
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateImplCopyWith<_$TemplateImpl> get copyWith =>
      __$$TemplateImplCopyWithImpl<_$TemplateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateImplToJson(
      this,
    );
  }
}

abstract class _Template implements Template {
  const factory _Template(
      {required final String version,
      final List<PageSchema> pages,
      final List<PluginSchema> plugins}) = _$TemplateImpl;

  factory _Template.fromJson(Map<String, dynamic> json) =
      _$TemplateImpl.fromJson;

  /// Version of the schema used to generate this template.
  @override
  String get version;

  /// Ordered list of pages in the template.
  @override
  List<PageSchema> get pages;

  /// List of plugins required to render this template.
  @override
  List<PluginSchema> get plugins;

  /// Create a copy of Template
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TemplateImplCopyWith<_$TemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
