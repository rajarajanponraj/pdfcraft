import 'package:pdfcraft_core/pdfcraft_core.dart';

void main() {
  const template = Template(
    version: '1.0',
    pages: [],
  );
  
  final json = template.toJson();
  print('Generated template JSON: $json');
}
