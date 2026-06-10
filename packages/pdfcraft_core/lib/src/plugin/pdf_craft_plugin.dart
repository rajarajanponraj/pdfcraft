import 'package:flutter/widgets.dart';

/// The base contract for all PDFCraft plugins.
abstract class PdfCraftPlugin {
  /// The unique identifier for this plugin type (e.g., 'text', 'image').
  String get name;

  /// Returns the widget used in the visual designer.
  Widget designerWidget();

  /// Returns the widget used in the generated form.
  Widget formWidget();

  /// Renders the component into the PDF document.
  void renderPdf();

  /// Serializes the plugin's state to JSON.
  Map<String, dynamic> serialize();

  /// Deserializes the plugin's state from JSON.
  void deserialize(Map<String, dynamic> json);

  /// Validates the plugin's current state.
  bool validate();
}
