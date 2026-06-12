import 'package:pdf/widgets.dart' as pw;
import 'package:pdfcraft_core/pdfcraft_core.dart';

/// Contract for rendering a specific field type into a pdf widget.
abstract class FieldRenderer {
  /// The plugin type this renderer supports (e.g., 'text', 'image').
  String get type;

  /// Renders the [field] into a [pw.Widget] suitable for absolute positioning.
  /// If [interactive] is true, form fields should render as AcroForms.
  pw.Widget render(FieldSchema field, pw.Context context, {bool interactive = false});
}
