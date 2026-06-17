import 'package:flutter_test/flutter_test.dart';
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/pdfcraft_generator.dart';
import 'package:pdfcraft_qrcode/pdfcraft_qrcode.dart';

void main() {
  test('PdfGeneratorEngine generates PDF bytes with QR code fields', () async {
    GeneratorRegistry.instance.register(QrCodeRenderer());

    const template = Template(
      version: '1.0',
      pages: [
        PageSchema(
          id: 'page1',
          width: 595,
          height: 842,
          fields: [
            FieldSchema(
              id: 'qr1',
              type: 'qrcode',
              x: 100,
              y: 100,
              width: 100,
              height: 100,
              data: {
                'data': 'https://example.com/dynamic/12345',
              },
            ),
          ],
        ),
      ],
    );

    final engine = PdfGeneratorEngine();
    final bytes = await engine.generate(template);

    expect(bytes, isNotEmpty);
    
    // Should have PDF header
    final header = String.fromCharCodes(bytes.sublist(0, 5));
    expect(header, '%PDF-');
  });
}
