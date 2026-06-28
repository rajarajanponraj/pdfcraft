# pdfcraft_barcode

[![pub package](https://img.shields.io/pub/v/pdfcraft_barcode.svg)](https://pub.dev/packages/pdfcraft_barcode)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-blue.svg)](https://pub.dev/packages/very_good_analysis)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Barcode rendering plugin for the **PDFCraft** ecosystem. Adds vector-rendered 1D barcode support (Code128, EAN13, UPC, Code39) to PDF documents and template builders.

---

## 🌟 What is `pdfcraft_barcode`?

`pdfcraft_barcode` allows developers to render high-density, vector-accurate barcodes directly within generated PDF documents or visual template editors. Essential for logistics shipping labels, retail receipts, ticket passes, and inventory tags.

### Key Capabilities:
* 📦 **Multiple Barcode Symbologies**: Code128, Code39, EAN-13, UPC-A, ITF, and more.
* 🎯 **Vector Sharpness**: Rendered as vector paths inside PDFs for crisp 100% scanning reliability.
* 🔗 **Dynamic Data Interpolation**: Bind dynamic barcodes to runtime data variables (`{{shipment.tracking_code}}`).

---

## 🚀 Getting Started

Add `pdfcraft_barcode` to your `pubspec.yaml`:

```bash
flutter pub add pdfcraft_barcode pdfcraft_core pdfcraft_generator
```

---

## 💻 Human-Centric Usage Examples

### Rendering a Shipping Label Barcode in PDF

Here is how human developers register and define a shipping label barcode inside a PDF template:

```dart
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/pdfcraft_generator.dart';
import 'package:pdfcraft_barcode/pdfcraft_barcode.dart';

void main() {
  // 1. Register BarcodeRenderer into GeneratorRegistry
  GeneratorRegistry.instance.register(BarcodeRenderer());

  // 2. Add a barcode field schema to your template page
  final barcodeField = FieldSchema(
    id: 'tracking_barcode',
    type: 'barcode',
    bounds: const RectBounds(x: 50, y: 200, width: 300, height: 80),
    properties: {
      'data': 'TRACK-987654321-US',
      'symbology': 'code128',
      'showText': true,
      'barColor': '#000000',
    },
  );

  print('Barcode plugin registered and configured for field: ${barcodeField.id}');
}
```

---

## 🛠️ Supported Symbologies

| Symbology Code | Name | Primary Use Case |
| :--- | :--- | :--- |
| `'code128'` | Code 128 | Logistics, shipping tracking, supply chain. |
| `'ean13'` | EAN-13 | International retail products. |
| `'upc_a'` | UPC-A | North American retail products. |
| `'code39'` | Code 39 | Industrial inventory and automotive ID tags. |

---

## 📄 License

This package is released under the [MIT License](LICENSE).
