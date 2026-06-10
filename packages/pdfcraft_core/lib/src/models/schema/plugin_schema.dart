import 'package:freezed_annotation/freezed_annotation.dart';

part 'plugin_schema.freezed.dart';
part 'plugin_schema.g.dart';

/// Represents a plugin registered in the template.
@freezed
class PluginSchema with _$PluginSchema {
  const factory PluginSchema({
    /// The unique name of the plugin (e.g., 'text', 'image').
    required String name,

    /// The version of the plugin used when the template was created.
    required String version,
  }) = _PluginSchema;

  factory PluginSchema.fromJson(Map<String, dynamic> json) =>
      _$PluginSchemaFromJson(json);
}
