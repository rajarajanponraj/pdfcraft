// ignore_for_file: avoid_print
import 'package:pdfcraft_core/pdfcraft_core.dart';

void main() {
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

  final jsonMap = template.toJson();
  print('Generated template JSON: $jsonMap');
}
