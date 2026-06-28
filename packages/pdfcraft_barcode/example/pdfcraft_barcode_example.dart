// ignore_for_file: avoid_print
import 'package:pdfcraft_barcode/pdfcraft_barcode.dart';
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/pdfcraft_generator.dart';

void main() {
  // Register the barcode renderer plugin
  GeneratorRegistry.instance.register(BarcodeRenderer());

  const barcodeField = FieldSchema(
    id: 'product_barcode',
    type: 'barcode',
    x: 50,
    y: 50,
    width: 200,
    height: 60,
    data: {
      'data': 'CODE128-EXAMPLE',
      'symbology': 'code128',
    },
  );

  print('Registered BarcodeRenderer and configured field: ${barcodeField.id}');
}
