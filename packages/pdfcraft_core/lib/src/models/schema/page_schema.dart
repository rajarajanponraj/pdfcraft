import 'package:freezed_annotation/freezed_annotation.dart';

import 'field_schema.dart';
import 'style_schema.dart';

part 'page_schema.freezed.dart';
part 'page_schema.g.dart';

/// Represents a single page in the PDF template.
@freezed
class PageSchema with _$PageSchema {
  const factory PageSchema({
    /// Unique identifier for the page.
    required String id,

    required double width,
    required double height,

    @Default([]) List<FieldSchema> fields,

    /// Optional styling for the page background.
    StyleSchema? style,
  }) = _PageSchema;

  factory PageSchema.fromJson(Map<String, dynamic> json) =>
      _$PageSchemaFromJson(json);
}
