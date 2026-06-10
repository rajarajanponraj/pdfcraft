import '../plugin/pdf_craft_plugin.dart';

/// Central registry for managing PDFCraft plugins.
class PluginRegistry {
  PluginRegistry._();

  /// Singleton instance.
  static final PluginRegistry instance = PluginRegistry._();

  final Map<String, PdfCraftPlugin Function()> _builders = {};

  /// Registers a new plugin builder under the given [name].
  void register(String name, PdfCraftPlugin Function() builder) {
    _builders[name] = builder;
  }

  /// Unregisters a plugin.
  void unregister(String name) {
    _builders.remove(name);
  }

  /// Instantiates a plugin by [name] and optionally [deserialize]s it with [json].
  PdfCraftPlugin? create(String name, [Map<String, dynamic>? json]) {
    final builder = _builders[name];
    if (builder != null) {
      final plugin = builder();
      if (json != null) {
        plugin.deserialize(json);
      }
      return plugin;
    }
    return null;
  }
}
