import 'dart:convert';
import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfcraft_core/pdfcraft_core.dart';

import 'field_renderer.dart';

class ImageRenderer implements FieldRenderer {
  @override
  String get type => 'image';

  @override
  pw.Widget render(FieldSchema field, pw.Context context) {
    final base64String = field.data['base64']?.toString();
    if (base64String == null || base64String.isEmpty) {
      return pw.SizedBox();
    }

    try {
      final Uint8List imageBytes = base64Decode(base64String);
      final memoryImage = pw.MemoryImage(imageBytes);

      return pw.Positioned(
        left: field.x,
        top: field.y,
        child: pw.SizedBox(
          width: field.width,
          height: field.height,
          child: pw.Image(memoryImage, fit: pw.BoxFit.contain),
        ),
      );
    } catch (e) {
      // Return empty box if image decoding fails
      return pw.SizedBox();
    }
  }
}
