import 'package:pdf/widgets.dart' as pw;
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/pdfcraft_generator.dart';

class CheckboxRenderer implements FieldRenderer {
  @override
  String get type => 'checkbox';

  @override
  pw.Widget render(FieldSchema field, pw.Context context, {bool interactive = false}) {
    // Value can be a boolean or a string "true"/"false" from data binding.
    final rawValue = field.data['value'];
    var checked = false;
    if (rawValue is bool) {
      checked = rawValue;
    } else if (rawValue is String) {
      checked = rawValue.toLowerCase() == 'true';
    }

    final name = field.data['name']?.toString() ?? field.id;

    if (interactive) {
      return pw.Positioned(
        left: field.x,
        top: field.y,
        child: pw.SizedBox(
          width: field.width,
          height: field.height,
          child: pw.Checkbox(
            name: name,
            value: checked,
          ),
        ),
      );
    } else {
      return pw.Positioned(
        left: field.x,
        top: field.y,
        child: pw.Container(
          width: field.width,
          height: field.height,
          decoration: pw.BoxDecoration(
            border: pw.Border.all(),
          ),
          child: checked
              ? pw.Center(child: pw.Text('X', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: field.height * 0.8)))
              : pw.SizedBox(),
        ),
      );
    }
  }
}
