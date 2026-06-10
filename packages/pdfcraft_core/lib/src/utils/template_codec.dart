import 'dart:convert';
import '../models/schema/template_schema.dart';

/// Helper utility for serializing and deserializing [Template] to/from JSON strings.
class TemplateCodec {
  TemplateCodec._();

  /// Converts a [Template] into a pretty-printed JSON string.
  static String encode(Template template) {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(template.toJson());
  }

  /// Parses a JSON string into a [Template].
  static Template decode(String jsonString) {
    final map = jsonDecode(jsonString) as Map<String, dynamic>;
    return Template.fromJson(map);
  }
}
