import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/pdfcraft_generator.dart';

class DropdownRenderer implements FieldRenderer {
  @override
  String get type => 'dropdown';

  @override
  pw.Widget render(FieldSchema field, pw.Context context, {bool interactive = false}) {
    final value = field.data['value']?.toString() ?? '';
    final name = field.data['name']?.toString() ?? field.id;
    
    // For dropdowns, we usually need a list of items.
    final itemsRaw = field.data['items'];
    var items = <String>[];
    if (itemsRaw is List) {
      items = itemsRaw.map((e) => e.toString()).toList();
    } else if (itemsRaw is String) {
      items = itemsRaw.split(',').map((e) => e.trim()).toList();
    }

    if (items.isEmpty) {
      items.add(value);
    }

    if (interactive) {
      // The pdf package doesn't natively support Choice fields (ComboBox/ListBox)
      // gracefully yet, but we can render a TextField for now or a custom interactive widget.
      // We will fallback to a TextField that acts as a dropdown.
      return pw.Positioned(
        left: field.x,
        top: field.y,
        child: pw.SizedBox(
          width: field.width,
          height: field.height,
          child: pw.TextField(
            name: name,
            value: value,
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
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(value, style: const pw.TextStyle(fontSize: 12)),
              pw.Text('v', style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey)),
            ],
          ),
        ),
      );
    }
  }
}
