import 'package:pdfcraft_generator/pdfcraft_generator.dart';
import 'package:pdfcraft_core/pdfcraft_core.dart';

void main() async {
  const template = Template(
    version: '1.0',
    pages: [],
  );

  final engine = PdfGeneratorEngine();
  final bytes = await engine.generate(template);
  
  print('Generated PDF of size: ${bytes.lengthInBytes} bytes');
}
