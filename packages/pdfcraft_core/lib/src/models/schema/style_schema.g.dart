// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'style_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StyleSchemaImpl _$$StyleSchemaImplFromJson(Map<String, dynamic> json) =>
    _$StyleSchemaImpl(
      fillColor: json['fillColor'] as String?,
      strokeColor: json['strokeColor'] as String?,
      strokeWidth: (json['strokeWidth'] as num?)?.toDouble(),
      opacity: (json['opacity'] as num?)?.toDouble(),
      fontFamily: json['fontFamily'] as String?,
      fontSize: (json['fontSize'] as num?)?.toDouble(),
      fontStyle: json['fontStyle'] as String?,
      textAlign: json['textAlign'] as String?,
    );

Map<String, dynamic> _$$StyleSchemaImplToJson(_$StyleSchemaImpl instance) =>
    <String, dynamic>{
      'fillColor': instance.fillColor,
      'strokeColor': instance.strokeColor,
      'strokeWidth': instance.strokeWidth,
      'opacity': instance.opacity,
      'fontFamily': instance.fontFamily,
      'fontSize': instance.fontSize,
      'fontStyle': instance.fontStyle,
      'textAlign': instance.textAlign,
    };
