import 'package:pdf/widgets.dart' as pw;
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/src/renderers/circle_renderer.dart';
import 'package:pdfcraft_generator/src/renderers/field_renderer.dart';
import 'package:pdfcraft_generator/src/renderers/image_renderer.dart';
import 'package:pdfcraft_generator/src/renderers/line_renderer.dart';
import 'package:pdfcraft_generator/src/renderers/rectangle_renderer.dart';
import 'package:pdfcraft_generator/src/renderers/text_renderer.dart';

class GeneratorRegistry {
  GeneratorRegistry._() {
    register(TextRenderer());
    register(ImageRenderer());
    register(LineRenderer());
    register(RectangleRenderer());
    register(CircleRenderer());
  }

  static final GeneratorRegistry instance = GeneratorRegistry._();

  final Map<String, FieldRenderer> _renderers = {};

  void register(FieldRenderer renderer) {
    _renderers[renderer.type] = renderer;
  }

  pw.Widget? renderField(FieldSchema field, pw.Context context, {bool interactive = false}) {
    final renderer = _renderers[field.type];
    if (renderer != null) {
      return renderer.render(field, context, interactive: interactive);
    }
    return null;
  }
}
