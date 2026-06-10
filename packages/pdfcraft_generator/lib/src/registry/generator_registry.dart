import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdf/widgets.dart' as pw;

import '../renderers/circle_renderer.dart';
import '../renderers/field_renderer.dart';
import '../renderers/image_renderer.dart';
import '../renderers/line_renderer.dart';
import '../renderers/rectangle_renderer.dart';
import '../renderers/text_renderer.dart';

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

  pw.Widget? renderField(FieldSchema field, pw.Context context) {
    final renderer = _renderers[field.type];
    if (renderer != null) {
      return renderer.render(field, context);
    }
    return null;
  }
}
