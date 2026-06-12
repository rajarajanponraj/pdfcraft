// ignore_for_file: avoid_print
import 'package:pdfcraft_core/pdfcraft_core.dart';

void main() {
  const template = Template(
    version: '1.0',
  );
  
  final json = template.toJson();
  print('Generated template JSON: $json');
}
