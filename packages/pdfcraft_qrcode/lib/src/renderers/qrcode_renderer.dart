import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/pdfcraft_generator.dart';

class QrCodeRenderer implements FieldRenderer {
  @override
  String get type => 'qrcode';

  @override
  pw.Widget render(FieldSchema field, pw.Context context, {bool interactive = false}) {
    final dataStr = field.data['data']?.toString() ?? 'https://pdfcraft.com';
    final colorHex = field.data['color']?.toString();
    
    // Using default error correct level (L) provided by pdf package
    final barcodeType = pw.Barcode.qrCode();

    PdfColor? color;
    if (colorHex != null && colorHex.isNotEmpty) {
      try {
        color = PdfColor.fromHex(colorHex);
      } catch (_) {
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
          drawText: false, // QR codes typically don't draw text below them
          color: color ?? PdfColors.black,
        ),
      ),
    );
  }
}
