import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'field_renderer.dart';

class LineRenderer implements FieldRenderer {
  @override
  String get type => 'line';

  @override
  pw.Widget render(FieldSchema field, pw.Context context) {
    final style = field.style;

    PdfColor? strokeColor;
    if (style?.strokeColor != null) {
      strokeColor = PdfColor.fromHex(style!.strokeColor!);
    } else {
      strokeColor = PdfColors.black;
    }

    final strokeWidth = style?.strokeWidth ?? 1.0;

    return pw.Positioned(
      left: field.x,
      top: field.y,
      child: pw.SizedBox(
        width: field.width,
        height: field.height,
        child: pw.CustomPaint(
          size: PdfPoint(field.width, field.height),
          painter: (PdfGraphics canvas, PdfPoint size) {
            canvas
              ..setStrokeColor(strokeColor!)
              ..setLineWidth(strokeWidth)
              // In PDF standard widgets context, custom paint 0,0 is bottom-left.
              // A line spanning the bounding box would go from (0, size.y) [top-left] to (size.x, 0) [bottom-right].
              ..drawLine(0, size.y, size.x, 0)
              ..strokePath();
          },
        ),
      ),
    );
  }
}
