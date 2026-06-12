import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_form/src/expressions/expression_engine.dart';

/// Responsible for traversing a Template and replacing `{{expr}}` bindings with evaluated data.
class DataBinder {

  DataBinder(this.engine);
  final ExpressionEngine engine;

  /// Returns a new Template with all string expressions in field data evaluated.
  Template bindTemplate(Template template) {
    final boundPages = template.pages.map((page) {
      final boundFields = page.fields.map(_bindField).toList();
      return page.copyWith(fields: boundFields);
    }).toList();

    return template.copyWith(pages: boundPages);
  }

  FieldSchema _bindField(FieldSchema field) {
    final boundData = <String, dynamic>{};
    
    field.data.forEach((key, value) {
      if (value is String) {
        boundData[key] = engine.evaluateInterpolatedString(value);
      } else {
        // Deep copy nested maps/lists if needed, but for MVP shallow pass is okay.
        boundData[key] = value;
      }
    });

    return field.copyWith(data: boundData);
  }
}
