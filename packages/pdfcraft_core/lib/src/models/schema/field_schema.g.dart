// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FieldSchemaImpl _$$FieldSchemaImplFromJson(Map<String, dynamic> json) =>
    _$FieldSchemaImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      data: json['data'] as Map<String, dynamic>,
      style: json['style'] == null
          ? null
          : StyleSchema.fromJson(json['style'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FieldSchemaImplToJson(_$FieldSchemaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'x': instance.x,
      'y': instance.y,
      'width': instance.width,
      'height': instance.height,
      'data': instance.data,
      'style': instance.style?.toJson(),
    };
