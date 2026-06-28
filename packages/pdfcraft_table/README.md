# pdfcraft_table

[![pub package](https://img.shields.io/pub/v/pdfcraft_table.svg)](https://pub.dev/packages/pdfcraft_table)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-blue.svg)](https://pub.dev/packages/very_good_analysis)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Dynamic multi-page tables, automatic row pagination, repeating headers, and cell merging plugin for the **PDFCraft** ecosystem.

---

## 🌟 What is `pdfcraft_table`?

Rendering complex data tables in PDF documents is notorious for pagination edge cases (e.g., rows overflowing off the bottom of a page, orphaned headers). `pdfcraft_table` solves this completely by delivering a robust, dynamic table renderer engine integrated into PDFCraft.

### Key Capabilities:
* 📊 **Dynamic Data Binding**: Bind lists of items directly to table rows.
* 📄 **Auto Pagination & Page Splitting**: Automatically breaks long tables across multiple pages cleanly without cutting off text.
* 🔄 **Repeating Headers**: Automatically repeats table headers at the top of every new page.
* 🎨 **Custom Cell Styling**: Alternating row backgrounds, custom borders, alignment, and column width distribution.

---

## 🚀 Getting Started

Add `pdfcraft_table` to your `pubspec.yaml`:

```bash
flutter pub add pdfcraft_table pdfcraft_core pdfcraft_generator
```

---

## 💻 Human-Centric Usage Examples

### 1. Registering and Using the Table Renderer in PDF Templates

Here is how human developers configure a dynamic itemized invoice table in PDF templates:

```dart
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/pdfcraft_generator.dart';
import 'package:pdfcraft_table/pdfcraft_table.dart';

void main() {
  // 1. Register the TableRenderer with GeneratorRegistry
  GeneratorRegistry.instance.register(TableRenderer());

  // 2. Define a table field schema with dynamic columns and rows
  final tableField = FieldSchema(
    id: 'invoice_items_table',
    type: 'table',
    bounds: const RectBounds(x: 40, y: 120, width: 515, height: 300),
    properties: {
      'repeatHeader': true,
      'columns': [
        {'title': 'Description', 'width': 0.5, 'align': 'left'},
        {'title': 'Qty', 'width': 0.15, 'align': 'center'},
        {'title': 'Unit Price', 'width': 0.15, 'align': 'right'},
        {'title': 'Total', 'width': 0.20, 'align': 'right'},
      ],
      'rows': [
        ['Software License (Annual)', '1', '\$1,200.00', '\$1,200.00'],
        ['Cloud Storage Add-on', '2', '\$150.00', '\$300.00'],
        ['Implementation Support', '5', '\$100.00', '\$500.00'],
      ],
      'headerStyle': {
        'backgroundColor': '#1E293B',
        'textColor': '#FFFFFF',
        'fontWeight': 'bold',
      },
      'alternateRowColor': '#F8FAFC',
    },
  );

  print('Table schema defined for field: ${tableField.id}');
}
```

---

## 🛠️ Table Pagination Mechanics (`TablePaginator`)

When table content exceeds page height, `TablePaginator` calculates cell heights and splits the table widget tree across PDF pages:

```
  Page 1                             Page 2 (Auto-Split)
  ┌───────────────────────────┐      ┌───────────────────────────┐
  │ [Header: Item | Qty | Price] │   │ [Header: Item | Qty | Price] ◄── Auto Repeated Header
  ├───────────────────────────┤      ├───────────────────────────┤
  │ Row 1: License...        │      │ Row 45: Support...        │
  │ Row 2: Storage...        │      │ Row 46: Maintenance...    │
  └───────────────────────────┘      └───────────────────────────┘
```

---

## 📄 License

This package is released under the [MIT License](LICENSE).
