import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/src/renderers/field_renderer.dart';

class CircleRenderer implements FieldRenderer {
  @override
  String get type => 'circle';

  @override
  pw.Widget render(FieldSchema field, pw.Context context, {bool interactive = false}) {
    final fillColorHex = field.data['fillColor']?.toString();
    final style = field.style;

    PdfColor? fillColor;
    if (style?.fillColor != null) {
      fillColor = PdfColor.fromHex(style!.fillColor!);
    }

    PdfColor? strokeColor;
    if (style?.strokeColor != null) {
      strokeColor = PdfColor.fromHex(style!.strokeColor!);
    }

    final strokeWidth = style?.strokeWidth ?? 1.0;

    return pw.Positioned(
      left: field.x,
      top: field.y,
      child: pw.Container(
        width: field.width,
        height: field.height,
        decoration: pw.BoxDecoration(
          shape: pw.BoxShape.circle,
          color: fillColorHex != null ? PdfColor.fromHex(fillColorHex) : fillColor,
          border: strokeColor != null
              ? pw.Border.all(color: strokeColor, width: strokeWidth)
              : null,
        ),
      ),
    );
  }
}
