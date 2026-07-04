# pdfcraft_form

[![pub package](https://img.shields.io/pub/v/pdfcraft_form.svg)](https://pub.dev/packages/pdfcraft_form)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-blue.svg)](https://pub.dev/packages/very_good_analysis)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Interactive AcroForm elements, dynamic data binding, and runtime expression evaluation engine for the **PDFCraft** ecosystem.

---

## 🌟 What is `pdfcraft_form`?

`pdfcraft_form` brings dynamic logic and interactive fillable forms to your PDF documents. It enables developers to bind runtime JSON data objects (e.g., user profiles, invoice totals) into template fields dynamically and render fillable PDF form fields (text fields, checkboxes, dropdowns).

### Key Capabilities:
* 📝 **Interactive Form Elements**: Render native fillable AcroForm text inputs, checkboxes, and select dropdowns inside generated PDFs.
* 🔗 **Dynamic Data Binding**: Inject dynamic context (`DataBinder`) into template placeholders (e.g., `{{customer.name}}`).
* 🧮 **Expression Engine**: Calculate expressions at runtime (e.g., `{{item.price * item.quantity}}`).

---

## 🚀 Getting Started

Add `pdfcraft_form` to your `pubspec.yaml`:

```bash
flutter pub add pdfcraft_form pdfcraft_core pdfcraft_generator
```

---

## 💻 Human-Centric Usage Examples

### 1. Evaluating Expressions and Data Binding

Here is how human developers use `ExpressionEngine` and `DataBinder` to compute dynamic fields:

```dart
import 'package:pdfcraft_form/pdfcraft_form.dart';

void main() {
  final context = {
    'user': {'name': 'Jane Doe', 'role': 'Administrator'},
    'order': {'subtotal': 100.0, 'taxRate': 0.15},
  };

  // 1. Interpolate string placeholders
  final binder = DataBinder(context);
  final greeting = binder.bind('Hello, {{user.name}}! Role: {{user.role}}');
  print(greeting); // Output: Hello, Jane Doe! Role: Administrator

  // 2. Evaluate mathematical expressions dynamically
  final engine = ExpressionEngine(context);
  final totalTax = engine.evaluate('order.subtotal * order.taxRate');
  print('Calculated Tax: \$$totalTax'); // Output: Calculated Tax: $15.0
}
```

### 2. Rendering Interactive Form Fields in PDFs

To render fillable PDF form fields, register form field renderers with your generator registry:

```dart
import 'package:pdfcraft_generator/pdfcraft_generator.dart';
import 'package:pdfcraft_form/pdfcraft_form.dart';

void registerFormPlugins() {
  // Register interactive form elements globally
  GeneratorRegistry.instance.register(TextFieldRenderer());
  GeneratorRegistry.instance.register(CheckboxRenderer());
  GeneratorRegistry.instance.register(DropdownRenderer());
}
```

---

## 🛠️ Supported Form Renderers

| Renderer | Field Type | PDF Output |
| :--- | :--- | :--- |
| `TextFieldRenderer` | `'text_field'` | Native fillable PDF text entry box. |
| `CheckboxRenderer` | `'checkbox'` | Native interactive PDF checkbox. |
| `DropdownRenderer` | `'dropdown'` | Native interactive PDF select menu. |

---

## 💖 Support the Project

If you find this package useful, please consider supporting its development:
* [Ko-fi](https://ko-fi.com/rajarajanp)
* [PayPal](https://www.paypal.com/ncp/payment/8UD5B3C8LH8HJ)

---

## 📄 License

This package is released under the [MIT License](LICENSE).
