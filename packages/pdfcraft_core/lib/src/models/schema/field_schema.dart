import 'package:freezed_annotation/freezed_annotation.dart';

import 'style_schema.dart';

part 'field_schema.freezed.dart';
part 'field_schema.g.dart';

/// Represents a field (plugin instance) on a page.
@freezed
class FieldSchema with _$FieldSchema {
  const factory FieldSchema({
    /// Unique identifier for the field.
    required String id,

    /// Type of the field, corresponding to a registered plugin name.
    required String type,

    required double x,
    required double y,
    required double width,
    required double height,

    /// Plugin-specific data.
    required Map<String, dynamic> data,

    /// Common styling properties.
    StyleSchema? style,
  }) = _FieldSchema;

  factory FieldSchema.fromJson(Map<String, dynamic> json) =>
      _$FieldSchemaFromJson(json);
}
