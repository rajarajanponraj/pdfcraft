import 'package:pdf/widgets.dart' as pw;
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/pdfcraft_generator.dart';

class TextFieldRenderer implements FieldRenderer {
  @override
  String get type => 'text_field';

  @override
  pw.Widget render(FieldSchema field, pw.Context context, {bool interactive = false}) {
    final text = field.data['value']?.toString() ?? '';
    final name = field.data['name']?.toString() ?? field.id;

    if (interactive) {
      return pw.Positioned(
        left: field.x,
        top: field.y,
        child: pw.SizedBox(
          width: field.width,
          height: field.height,
          child: pw.TextField(
            name: name,
            value: text,
            textStyle: const pw.TextStyle(fontSize: 12),
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
          padding: const pw.EdgeInsets.all(2),
          child: pw.Text(text, style: const pw.TextStyle(fontSize: 12)),
        ),
      );
    }
  }
}
