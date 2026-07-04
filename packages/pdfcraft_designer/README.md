# pdfcraft_designer

[![pub package](https://img.shields.io/pub/v/pdfcraft_designer.svg)](https://pub.dev/packages/pdfcraft_designer)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-blue.svg)](https://pub.dev/packages/very_good_analysis)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Interactive drag-and-drop PDF template designer UI widget for Flutter. Enables non-technical users to design, edit, and inspect PDF layouts visually in web, desktop, and mobile Flutter applications.

---

## 🌟 What is `pdfcraft_designer`?

Building custom document builders inside business web tools or administrative dashboards can be complex. `pdfcraft_designer` delivers a complete, interactive canvas component that embeds cleanly into your Flutter application.

### Key Capabilities:
* 🖱️ **Drag-and-Drop Canvas**: Drag, move, resize, and position document elements on a visual page layout.
* 📏 **Grid Snapping & Guidelines**: Precise alignment tools and configurable grid snapping.
* 🎛️ **Property Inspector**: Edit field attributes (font size, colors, dimensions, bindings) live.
* ↩️ **State & History Stack**: Full Undo/Redo capability managed through `DesignerState`.

---

## 🚀 Getting Started

Add `pdfcraft_designer` to your `pubspec.yaml`:

```bash
flutter pub add pdfcraft_designer pdfcraft_core
```

---

## 💻 Human-Centric Usage Examples

### Embedding the Visual Designer in a Flutter Screen

Here is how human developers integrate `DesignerCanvas` and `InspectorPanel` into a split-view editor screen:

```dart
import 'package:flutter/material.dart';
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_designer/pdfcraft_designer.dart';

class TemplateEditorScreen extends StatefulWidget {
  const TemplateEditorScreen({super.key});

  @override
  State<TemplateEditorScreen> createState() => _TemplateEditorScreenState();
}

class _TemplateEditorScreenState extends State<TemplateEditorScreen> {
  late final DesignerState _designerState;

  @override
  void initState() {
    super.initState();
    // Initialize state with an empty template or existing template
    _designerState = DesignerState(
      initialTemplate: const TemplateSchema(
        version: '1.0.0',
        pages: [
          PageSchema(width: 595.28, height: 841.89, fields: []),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _designerState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Template Designer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: _designerState.undo,
          ),
          IconButton(
            icon: const Icon(Icons.redo),
            onPressed: _designerState.redo,
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.save),
            label: const Text('Save Template'),
            onPressed: () {
              final updatedTemplate = _designerState.currentTemplate;
              print('Saved template JSON: ${updatedTemplate.toJson()}');
            },
          ),
        ],
      ),
      body: Row(
        children: [
          // Main interactive canvas
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.grey[200],
              child: DesignerCanvas(
                state: _designerState,
                showGrid: true,
                gridSize: 10,
              ),
            ),
          ),
          // Right property inspector panel
          Expanded(
            flex: 1,
            child: InspectorPanel(
              state: _designerState,
            ),
          ),
        ],
      ),
    );
  }
}
```

---

## 🏗️ UI Component Architecture

```
  ┌──────────────────────────────────────────────────────────┐
  │                   TemplateEditorScreen                   │
  └────────────────────────────┬─────────────────────────────┘
                               │
            ┌──────────────────┴──────────────────┐
            ▼                                     ▼
  ┌───────────────────┐                 ┌───────────────────┐
  │  DesignerCanvas   │                 │  InspectorPanel   │
  │  (Visual Builder) │ ◄──Sync State──►│ (Property Editor) │
  └───────────────────┘                 └───────────────────┘
```

---

## 💖 Support the Project

If you find this package useful, please consider supporting its development:
* [Ko-fi](https://ko-fi.com/rajarajanp)
* [PayPal](https://www.paypal.com/ncp/payment/8UD5B3C8LH8HJ)

---

## 📄 License

This package is released under the [MIT License](LICENSE).
