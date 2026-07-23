// Example files are allowed to print to the console.
// ignore_for_file: avoid_print
import 'package:pdfcraft_form/pdfcraft_form.dart';

void main() {
  final context = {
    'user': {'name': 'Jane Doe', 'role': 'Administrator'},
    'order': {'subtotal': 150, 'taxRate': 0.10},
  };

  // 1. Evaluate string interpolation
  final engine = ExpressionEngine(data: context);
  final greeting = engine.evaluateInterpolatedString('Welcome, {{user.name}}! Role: {{user.role}}');
  print(greeting);

  // 2. Evaluate expressions dynamically
  final tax = engine.evaluateExpression('user.role');
  print('Evaluated Role: $tax');
}
