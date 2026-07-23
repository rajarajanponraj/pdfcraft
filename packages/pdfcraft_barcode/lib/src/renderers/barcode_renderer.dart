import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/pdfcraft_generator.dart';

class BarcodeRenderer implements FieldRenderer {
  @override
  String get type => 'barcode';

  @override
  pw.Widget render(FieldSchema field, pw.Context context, {bool interactive = false}) {
    final barcodeTypeStr = field.data['barcodeType']?.toString().toLowerCase() ?? 'code128';
    final dataStr = field.data['data']?.toString() ?? '1234567890';
    final drawText = field.data['drawText'] as bool? ?? true;
    final colorHex = field.data['color']?.toString();
    
    pw.Barcode barcodeType;
    switch (barcodeTypeStr) {
      case 'ean13':
        barcodeType = pw.Barcode.ean13();
      case 'upca':
      case 'upc':
        barcodeType = pw.Barcode.upcA();
      case 'code128':
      default:
        barcodeType = pw.Barcode.code128();
    }

    PdfColor? color;
    if (colorHex != null && colorHex.isNotEmpty) {
      try {
        color = PdfColor.fromHex(colorHex);
      } on Exception catch (_) {
        // Fallback to null if invalid hex
      }
    }

    return pw.Positioned(
      left: field.x,
      top: field.y,
      child: pw.SizedBox(
        width: field.width,
        height: field.height,
        child: pw.BarcodeWidget(
          barcode: barcodeType,
          data: dataStr,
          drawText: drawText,
          color: color ?? PdfColors.black,
          textStyle: pw.TextStyle(fontSize: 10, color: color ?? PdfColors.black),
        ),
      ),
    );
  }
}
