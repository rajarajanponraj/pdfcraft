# pdfcraft_core

[![pub package](https://img.shields.io/pub/v/pdfcraft_core.svg)](https://pub.dev/packages/pdfcraft_core)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-blue.svg)](https://pub.dev/packages/very_good_analysis)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

The foundational core schemas, JSON serialization models (`Template`, `Page`, `Field`, `Style`), and plugin architecture for the **PDFCraft** ecosystem.

---

## 🌟 What is `pdfcraft_core`?

In modern web and mobile applications, building PDF generation engines often requires decoupling **template structure** from **rendering logic**. 

`pdfcraft_core` provides the standard data models and contracts that power the entire PDFCraft monorepo. It allows developers to:
* 📄 Define PDF layouts using strongly-typed Dart models or lightweight JSON templates.
* 🔄 Transport PDF template schemas seamlessly across REST APIs, databases, and microservices.
* 🔌 Extend PDF generation capabilities by creating custom field plugins.

---

## 🚀 Getting Started

Add `pdfcraft_core` to your `pubspec.yaml`:

```bash
flutter pub add pdfcraft_core
```

Or depend on it directly in pure Dart applications:

```bash
dart pub add pdfcraft_core
```

---

## 💻 Human-Centric Usage Examples

### 1. Creating and Serializing a PDF Template Model

Imagine you are building a SaaS backend that stores dynamic invoice templates in PostgreSQL as JSON. Here is how human developers build and serialize templates using `pdfcraft_core`:

```dart
import 'dart:convert';
import 'package:pdfcraft_core/pdfcraft_core.dart';

void main() {
  // 1. Define a page layout with a title text field
  const page = PageSchema(
    width: 595.28,  // A4 Width in points
    height: 841.89, // A4 Height in points
    fields: [
      FieldSchema(
        id: 'header_title',
        type: 'text',
        bounds: RectBounds(x: 50, y: 50, width: 500, height: 40),
        properties: {
          'text': 'INVOICE #{{invoice.number}}',
          'fontSize': 24,
          'fontWeight': 'bold',
        },
      ),
    ],
  );

  // 2. Wrap into a full template model
  const template = TemplateSchema(
    version: '1.0.0',
    pages: [page],
  );

  // 3. Serialize to JSON for database storage or API response
  final jsonMap = template.toJson();
  final jsonString = jsonEncode(jsonMap);

  print('Serialized Template JSON:\n$jsonString');
}
```

### 2. Registering Custom Plugins

`pdfcraft_core` defines the `PdfcraftPlugin` interface. You can register custom field renderers globally so that both the generator and designer recognize your custom elements.

```dart
import 'package:pdfcraft_core/pdfcraft_core.dart';

class WatermarkPlugin implements PdfcraftPlugin {
  @override
  String get pluginId => 'com.example.watermark';

  @override
  String get fieldType => 'watermark';

  @override
  void initialize() {
    // Register custom plugin capabilities
  }
}

void main() {
  // Register the plugin globally
  PluginRegistry.instance.register(WatermarkPlugin());
  
  print('Registered plugins: ${PluginRegistry.instance.registeredIds}');
}
```

---

## 🏗️ Architecture Overview

```
  ┌──────────────────────────────────────────────────────────┐
  │                     TemplateSchema                       │
  │  - version: String                                       │
  │  - pages: List<PageSchema>                               │
  └────────────────────────────┬─────────────────────────────┘
                               │
                               ▼
  ┌──────────────────────────────────────────────────────────┐
  │                       PageSchema                         │
  │  - width & height: double                                │
  │  - fields: List<FieldSchema>                             │
  └────────────────────────────┬─────────────────────────────┘
                               │
                               ▼
  ┌──────────────────────────────────────────────────────────┐
  │                      FieldSchema                         │
  │  - id: String                                            │
  │  - type: String ('text', 'image', 'table', etc.)         │
  │  - bounds: RectBounds (x, y, width, height)              │
  │  - properties: Map<String, dynamic>                      │
  └──────────────────────────────────────────────────────────┘
```

---

## 💡 Key Features & Specifications

| Feature | Description |
| :--- | :--- |
| **JSON Serialization** | Deep nested JSON support via `TemplateCodec` and `json_serializable`. |
| **Strong Types** | Safe handling of positioning, dimensions (`RectBounds`), and styles. |
| **Plugin Registry** | Extensible plugin architecture for custom elements. |
| **Zero Heavy UI Dependencies** | Can run in pure Dart backend services or Flutter clients. |

---

## 💖 Support the Project

If you find this package useful, please consider supporting its development:
* [Ko-fi](https://ko-fi.com/rajarajanp)
* [PayPal](https://www.paypal.com/ncp/payment/8UD5B3C8LH8HJ)

---

## 📄 License

This package is released under the [MIT License](LICENSE).
