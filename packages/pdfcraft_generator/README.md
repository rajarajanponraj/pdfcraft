# pdfcraft_generator

The PDF generation engine for PDFCraft, mapping abstract schemas to actual PDF `pw.Widget` instances using the `pdf` package.

## Features

- Dynamic rendering of templates.
- Built-in `TextRenderer` and `ImageRenderer`.
- Custom font support via `FontManager`.

## Getting started

```yaml
dependencies:
  pdfcraft_generator: ^0.1.0
```

## Usage

```dart
import 'package:pdfcraft_generator/pdfcraft_generator.dart';
import 'package:pdfcraft_core/pdfcraft_core.dart';

void main() async {
  const template = Template(version: '1.0', pages: []);
  final engine = PdfGeneratorEngine();
  final bytes = await engine.generate(template);
  // Save bytes to file...
}
```
