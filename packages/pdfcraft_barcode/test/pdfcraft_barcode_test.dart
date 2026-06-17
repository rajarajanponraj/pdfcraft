import 'package:flutter_test/flutter_test.dart';
import 'package:pdfcraft_barcode/pdfcraft_barcode.dart';
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/pdfcraft_generator.dart';

void main() {
  test('PdfGeneratorEngine generates PDF bytes with Barcode fields', () async {
    // Register the barcode renderer
    GeneratorRegistry.instance.register(BarcodeRenderer());

    const template = Template(
      version: '1.0',
      pages: [
        PageSchema(
          id: 'page1',
          width: 595,
          height: 842,
          fields: [
            FieldSchema(
              id: 'barcode1',
              type: 'barcode',
              x: 100,
              y: 100,
              width: 200,
              height: 50,
              data: {
                'barcodeType': 'code128',
                'data': 'PDFCRAFT-TEST',
              },
            ),
            FieldSchema(
              id: 'barcode2',
              type: 'barcode',
              x: 100,
              y: 200,
              width: 150,
              height: 50,
              data: {
                'barcodeType': 'upca',
                'data': '012345678905',
              },
            ),
            FieldSchema(
              id: 'barcode3',
              type: 'barcode',
              x: 100,
              y: 300,
              width: 150,
              height: 50,
              data: {
                'barcodeType': 'ean13',
                'data': '1234567890128',
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
