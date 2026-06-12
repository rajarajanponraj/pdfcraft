import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/pdfcraft_generator.dart';

class TableRenderer implements FieldRenderer {
  @override
  String get type => 'table';

  @override
  pw.Widget render(FieldSchema field, pw.Context context, {bool interactive = false}) {
    // Columns is a comma separated string or a list
    final columnsRaw = field.data['columns'];
    var columns = <String>[];
    if (columnsRaw is List) {
      columns = columnsRaw.map((e) => e.toString()).toList();
    } else if (columnsRaw is String) {
      columns = columnsRaw.split(',').map((e) => e.trim()).toList();
    }

    // Items should be an evaluated list of maps
    final itemsRaw = field.data['items'];
    var items = <dynamic>[];
    if (itemsRaw is List) {
      items = itemsRaw;
    }

    if (columns.isEmpty) {
      return pw.Positioned(
        left: field.x,
        top: field.y,
        child: pw.Text('Table missing columns configuration'),
      );
    }

    final headerRow = pw.TableRow(
      decoration: const pw.BoxDecoration(color: PdfColors.grey300),
      children: columns.map((col) => pw.Padding(
        padding: const pw.EdgeInsets.all(4),
        child: pw.Text(col.toUpperCase(), style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),
      ),).toList(),
    );

    final dataRows = items.map((item) {
      return pw.TableRow(
        children: columns.map((col) {
          final val = item is Map ? item[col]?.toString() ?? '' : '';
          return pw.Padding(
            padding: const pw.EdgeInsets.all(4),
            child: pw.Text(val, style: const pw.TextStyle(fontSize: 10)),
          );
        }).toList(),
      );
    }).toList();

    return pw.Positioned(
      left: field.x,
      top: field.y,
      child: pw.SizedBox(
        width: field.width,
        height: field.height,
        child: pw.Table(
          border: pw.TableBorder.all(),
          children: [
            headerRow,
            ...dataRows,
          ],
        ),
      ),
    );
  }
}
