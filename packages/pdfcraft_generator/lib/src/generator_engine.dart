import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfcraft_core/pdfcraft_core.dart';

import 'registry/generator_registry.dart';

class PdfGeneratorEngine {
  /// Generates a PDF byte array from a [Template].
  Future<Uint8List> generate(Template template) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);

    for (final pageSchema in template.pages) {
      final pageFormat = PdfPageFormat(
        pageSchema.width,
        pageSchema.height,
        marginAll: 0, // We use absolute positioning inside a Stack
      );

      pdf.addPage(
        pw.Page(
          pageFormat: pageFormat,
          build: (pw.Context context) {
            final children = <pw.Widget>[];

            for (final field in pageSchema.fields) {
              final widget = GeneratorRegistry.instance.renderField(field, context);
              if (widget != null) {
                children.add(widget);
              }
            }

            return pw.Stack(
              children: children,
            );
          },
        ),
      );
    }

    return pdf.save();
  }
}
