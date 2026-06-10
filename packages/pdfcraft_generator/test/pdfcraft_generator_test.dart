import 'package:flutter_test/flutter_test.dart';
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/pdfcraft_generator.dart';

void main() {
  test('PdfGeneratorEngine generates PDF bytes', () async {
    // 1x1 pixel base64 transparent PNG image
    const base64Image = 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNkYAAAAAYAAjCB0C8AAAAASUVORK5CYII=';

    const template = Template(
      version: '1.0',
      pages: [
        PageSchema(
          id: 'page1',
          width: 595,
          height: 842,
          fields: [
            FieldSchema(
              id: 'text1',
              type: 'text',
              x: 100,
              y: 100,
              width: 200,
              height: 50,
              data: {'text': 'Hello PDFCraft'},
              style: StyleSchema(fontSize: 24, fillColor: '#FF0000'),
            ),
            FieldSchema(
              id: 'img1',
              type: 'image',
              x: 100,
              y: 200,
              width: 100,
              height: 100,
              data: {'base64': base64Image},
            ),
            FieldSchema(
              id: 'rect1',
              type: 'rectangle',
              x: 10,
              y: 10,
              width: 50,
              height: 50,
              data: {},
              style: StyleSchema(fillColor: '#00FF00', strokeColor: '#000000', strokeWidth: 2),
            ),
            FieldSchema(
              id: 'circle1',
              type: 'circle',
              x: 70,
              y: 10,
              width: 50,
              height: 50,
              data: {},
              style: StyleSchema(fillColor: '#0000FF'),
            ),
            FieldSchema(
              id: 'line1',
              type: 'line',
              x: 10,
              y: 70,
              width: 100,
              height: 10,
              data: {},
              style: StyleSchema(strokeColor: '#FF0000', strokeWidth: 3),
            ),
            FieldSchema(
              id: 'unknown_plugin',
              type: 'something_else',
              x: 0,
              y: 0,
              width: 10,
              height: 10,
              data: {},
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
