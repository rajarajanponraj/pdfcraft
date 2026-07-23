// Example files are allowed to print to the console.
// ignore_for_file: avoid_print
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/pdfcraft_generator.dart';
import 'package:pdfcraft_qrcode/pdfcraft_qrcode.dart';

void main() {
  // Register the QR code renderer plugin
  GeneratorRegistry.instance.register(QrCodeRenderer());

  const qrField = FieldSchema(
    id: 'verification_qr',
    type: 'qrcode',
    x: 400,
    y: 700,
    width: 100,
    height: 100,
    data: {
      'data': 'https://pdfcraft.dev/verify/12345',
      'color': '#0F172A',
    },
  );

  print('Registered QrCodeRenderer and configured field: ${qrField.id}');
}
