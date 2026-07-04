# pdfcraft_generator

[![pub package](https://img.shields.io/pub/v/pdfcraft_generator.svg)](https://pub.dev/packages/pdfcraft_generator)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-blue.svg)](https://pub.dev/packages/very_good_analysis)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

High-performance PDF rendering engine for the **PDFCraft** ecosystem. Compiles JSON template schemas (`TemplateSchema`) into print-ready PDF documents using custom font management and extensible field renderers.

---

## 🌟 What is `pdfcraft_generator`?

`pdfcraft_generator` is the execution powerhouse of PDFCraft. It takes abstract `TemplateSchema` definitions and converts them into binary PDF byte arrays (`Uint8List`) suitable for saving to disk, streaming to network clients, or displaying in Flutter previewers.

### Key Capabilities:
* 🖨️ **JSON to PDF Compilation**: Convert JSON template structures into valid PDF documents seamlessly.
* 🔤 **FontManager**: Register external TTF/OTF fonts dynamically for multi-language and branded PDF rendering.
* 🎨 **Core Shape Renderers**: Built-in support for styled text, images, lines, rectangles, and circles.
* 🔌 **Renderer Registry**: Plug in custom field renderers for extended document widgets.

---

## 🚀 Getting Started

Add `pdfcraft_generator` and `pdfcraft_core` to your project:

```bash
flutter pub add pdfcraft_generator pdfcraft_core
```

---

## 💻 Human-Centric Usage Examples

### 1. Generating a PDF Document from Code

Here is how human developers render a simple PDF invoice document asynchronously:

```dart
import 'dart:io';
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/pdfcraft_generator.dart';

Future<void> main() async {
  // 1. Construct the template schema
  const template = TemplateSchema(
    version: '1.0.0',
    pages: [
      PageSchema(
        width: 595.28, // A4 width
        height: 841.89, // A4 height
        fields: [
          FieldSchema(
            id: 'title',
            type: 'text',
            bounds: RectBounds(x: 40, y: 40, width: 500, height: 30),
            properties: {
              'text': 'Official Receipt',
              'fontSize': 22,
              'fontWeight': 'bold',
              'color': '#1E293B',
            },
          ),
          FieldSchema(
            id: 'divider',
            type: 'line',
            bounds: RectBounds(x: 40, y: 80, width: 515, height: 2),
            properties: {
              'strokeColor': '#CBD5E1',
              'strokeWidth': 1.5,
            },
          ),
        ],
      ),
    ],
  );

  // 2. Instantiate the generator engine
  final engine = PdfGeneratorEngine();

  // 3. Compile template to PDF byte array
  final pdfBytes = await engine.generate(template);

  // 4. Save to disk or return as HTTP response
  final file = File('receipt.pdf');
  await file.writeAsBytes(pdfBytes);
  print('PDF successfully generated at ${file.path}');
}
```

### 2. Loading Custom External Fonts

To render custom brand fonts (e.g., Roboto, Open Sans) in your PDFs, register them with `FontManager` before generation:

```dart
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdfcraft_generator/pdfcraft_generator.dart';

Future<void> setupFonts() async {
  final fontData = await rootBundle.load('assets/fonts/CustomFont.ttf');
  
  // Register custom font for generator usage
  FontManager.instance.registerFont(
    'CustomFont',
    fontData.buffer.asUint8List(),
  );
}
```

---

## 🛠️ Extensibility: Writing a Custom Renderer

If you create a new element type, implement `FieldRenderer` and register it with `GeneratorRegistry`:

```dart
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/pdfcraft_generator.dart';

class StarRenderer extends FieldRenderer {
  @override
  String get fieldType => 'star';

  @override
  pw.Widget render(FieldSchema field, BuildContext context) {
    return pw.Container(
      width: field.bounds.width,
      height: field.bounds.height,
      child: pw.Text('⭐'),
    );
  }
}

void main() {
  // Register custom renderer globally
  GeneratorRegistry.instance.register(StarRenderer());
}
```

---

## 💖 Support the Project

If you find this package useful, please consider supporting its development:
* [Ko-fi](https://ko-fi.com/rajarajanp)
* [PayPal](https://www.paypal.com/ncp/payment/8UD5B3C8LH8HJ)

---

## 📄 License

This package is released under the [MIT License](LICENSE).
