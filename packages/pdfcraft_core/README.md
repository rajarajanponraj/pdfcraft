# pdfcraft_core

Core models, schemas, and plugin contracts for the PDFCraft ecosystem.

## Features

- **Schema Engine:** Fully serializable templates using `freezed`.
- **Plugin Contract:** `PdfCraftPlugin` abstract interface.
- **Plugin Registry:** Map strings to plugin builders.

## Getting started

```yaml
dependencies:
  pdfcraft_core: ^0.1.0
```

## Usage

```dart
import 'package:pdfcraft_core/pdfcraft_core.dart';

void main() {
  const template = Template(
    version: '1.0',
    pages: [],
  );
  
  final json = template.toJson();
  print(json);
}
```
