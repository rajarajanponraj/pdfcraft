// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageSchemaImpl _$$PageSchemaImplFromJson(Map<String, dynamic> json) =>
    _$PageSchemaImpl(
      id: json['id'] as String,
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      fields: (json['fields'] as List<dynamic>?)
              ?.map((e) => FieldSchema.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      style: json['style'] == null
          ? null
          : StyleSchema.fromJson(json['style'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PageSchemaImplToJson(_$PageSchemaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'fields': instance.fields.map((e) => e.toJson()).toList(),
      'style': instance.style?.toJson(),
    };
