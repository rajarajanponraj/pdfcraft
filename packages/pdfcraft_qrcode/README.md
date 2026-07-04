# pdfcraft_qrcode

[![pub package](https://img.shields.io/pub/v/pdfcraft_qrcode.svg)](https://pub.dev/packages/pdfcraft_qrcode)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-blue.svg)](https://pub.dev/packages/very_good_analysis)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Vector QR code rendering plugin for the **PDFCraft** ecosystem. Easily render dynamic and static QR codes in PDF invoices, event tickets, and verification certificates.

---

## 🌟 What is `pdfcraft_qrcode`?

`pdfcraft_qrcode` enables developers to embed crisp vector 2D QR codes directly into PDF document templates. Whether linking to online bill payment web pages, digital event passes, or cryptographic verification checksums, this plugin handles QR code generation seamlessly.

### Key Capabilities:
* 📲 **Dynamic Data Binding**: Bind runtime URLs and payload variables (`https://pay.example.com/invoice/{{invoice.id}}`).
* 🎯 **Vector Sharpness**: Rendered directly as crisp PDF vector shapes for effortless smartphone camera scanning.
* 🛡️ **Error Correction Levels**: Configurable error correction (Low, Medium, Quartile, High) to accommodate logo embedding or damaged print surface recovery.

---

## 🚀 Getting Started

Add `pdfcraft_qrcode` to your `pubspec.yaml`:

```bash
flutter pub add pdfcraft_qrcode pdfcraft_core pdfcraft_generator
```

---

## 💻 Human-Centric Usage Examples

### Embedding a Payment QR Code in a PDF Invoice

Here is how human developers register and define a dynamic QR code field inside a PDF template:

```dart
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/pdfcraft_generator.dart';
import 'package:pdfcraft_qrcode/pdfcraft_qrcode.dart';

void main() {
  // 1. Register QrcodeRenderer into GeneratorRegistry
  GeneratorRegistry.instance.register(QrcodeRenderer());

  // 2. Add a QR code field schema to your template page
  final qrField = FieldSchema(
    id: 'payment_qr',
    type: 'qrcode',
    bounds: const RectBounds(x: 435, y: 700, width: 100, height: 100),
    properties: {
      'data': 'https://pay.example.com/checkout?id=INV-2026-001',
      'errorCorrectionLevel': 'H', // High error correction
      'moduleColor': '#0F172A',
    },
  );

  print('QR Code plugin registered and configured for field: ${qrField.id}');
}
```

---

## ⚙️ Configuration Options

| Property | Type | Description | Default |
| :--- | :--- | :--- | :--- |
| `data` | `String` | URL or string payload encoded inside the QR code. | `""` |
| `errorCorrectionLevel` | `String` | Error correction level: `'L'`, `'M'`, `'Q'`, or `'H'`. | `'M'` |
| `moduleColor` | `String` | Hex color string for QR code modules. | `'#000000'` |

---

## 💖 Support the Project

If you find this package useful, please consider supporting its development:
* [Ko-fi](https://ko-fi.com/rajarajanp)
* [PayPal](https://www.paypal.com/ncp/payment/8UD5B3C8LH8HJ)

---

## 📄 License

This package is released under the [MIT License](LICENSE).
