// ignore_for_file: avoid_print
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/pdfcraft_generator.dart';

void main() async {
  const template = Template(
    version: '1.0.0',
    pages: [
      PageSchema(
        id: 'page_1',
        width: 595.28,
        height: 841.89,
      ),
    ],
  );

  final engine = PdfGeneratorEngine();
  final bytes = await engine.generate(template);

  print('Generated PDF of size: ${bytes.lengthInBytes} bytes');
}
