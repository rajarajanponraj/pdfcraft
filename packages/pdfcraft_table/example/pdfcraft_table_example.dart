// Example files are allowed to print to the console.
// ignore_for_file: avoid_print
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_generator/pdfcraft_generator.dart';
import 'package:pdfcraft_table/pdfcraft_table.dart';

void main() {
  // Register the table renderer plugin
  GeneratorRegistry.instance.register(TableRenderer());

  const tableField = FieldSchema(
    id: 'items_table',
    type: 'table',
    x: 40,
    y: 100,
    width: 500,
    height: 200,
    data: {
      'columns': ['Item', 'Quantity', 'Price'],
      'rows': [
        ['Widget A', '2', r'$50.00'],
        ['Widget B', '1', r'$100.00'],
      ],
    },
  );

  print('Registered TableRenderer and configured field: ${tableField.id}');
}
