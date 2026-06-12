import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfcraft_core/pdfcraft_core.dart';

import 'package:pdfcraft_generator/src/fonts/font_manager.dart';
import 'package:pdfcraft_generator/src/renderers/field_renderer.dart';

class TextRenderer implements FieldRenderer {
  @override
  String get type => 'text';

  @override
  pw.Widget render(FieldSchema field, pw.Context context, {bool interactive = false}) {
    final text = field.data['text'] as String? ?? '';
    final style = field.style;

    pw.Font? font;
    if (style?.fontFamily != null) {
      font = FontManager.instance.getFont(style!.fontFamily!);
    }

    // Default to Helvetica if no font found or specified
    font ??= pw.Font.helvetica();

    final fontSize = style?.fontSize ?? 12.0;

    PdfColor? color;
    if (style?.fillColor != null) {
      color = PdfColor.fromHex(style!.fillColor!);
    }

    return pw.Positioned(
      left: field.x,
      top: field.y,
      child: pw.SizedBox(
        width: field.width,
        height: field.height,
        child: pw.Text(
          text,
          style: pw.TextStyle(
            font: font,
            fontSize: fontSize,
            color: color ?? PdfColors.black,
          ),
        ),
      ),
    );
  }
}
