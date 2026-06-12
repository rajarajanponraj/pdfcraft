import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:pdfcraft_core/src/models/schema/page_schema.dart';
import 'package:pdfcraft_core/src/models/schema/plugin_schema.dart';

part 'template_schema.freezed.dart';
part 'template_schema.g.dart';

/// The root schema for a PDFCraft template.
@freezed
class Template with _$Template {
  const factory Template({
    /// Version of the schema used to generate this template.
    required String version,

    /// Ordered list of pages in the template.
    @Default([]) List<PageSchema> pages,

    /// List of plugins required to render this template.
    @Default([]) List<PluginSchema> plugins,
  }) = _Template;

  factory Template.fromJson(Map<String, dynamic> json) =>
      _$TemplateFromJson(json);
}
