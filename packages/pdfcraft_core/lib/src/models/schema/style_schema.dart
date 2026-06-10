import 'package:freezed_annotation/freezed_annotation.dart';

part 'style_schema.freezed.dart';
part 'style_schema.g.dart';

/// Represents styling properties for fields and pages.
@freezed
class StyleSchema with _$StyleSchema {
  const factory StyleSchema({
    String? fillColor,
    String? strokeColor,
    double? strokeWidth,
    double? opacity,
    String? fontFamily,
    double? fontSize,
    String? fontStyle,
    String? textAlign,
  }) = _StyleSchema;

  factory StyleSchema.fromJson(Map<String, dynamic> json) =>
      _$StyleSchemaFromJson(json);
}
