// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplateImpl _$$TemplateImplFromJson(Map<String, dynamic> json) =>
    _$TemplateImpl(
      version: json['version'] as String,
      pages: (json['pages'] as List<dynamic>?)
              ?.map((e) => PageSchema.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      plugins: (json['plugins'] as List<dynamic>?)
              ?.map((e) => PluginSchema.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TemplateImplToJson(_$TemplateImpl instance) =>
    <String, dynamic>{
      'version': instance.version,
      'pages': instance.pages.map((e) => e.toJson()).toList(),
      'plugins': instance.plugins.map((e) => e.toJson()).toList(),
    };
