import 'package:flutter_test/flutter_test.dart';
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_form/pdfcraft_form.dart';

void main() {
  group('ExpressionEngine', () {
    test('Evaluates interpolated string', () {
      final engine = ExpressionEngine(data: {'user': {'name': 'Alice'}});
      expect(engine.evaluateInterpolatedString('Hello {{user.name}}!'), 'Hello Alice!');
    });

    test('Evaluates conditions', () {
      final engine = ExpressionEngine(data: {'age': 20});
      expect(engine.evaluateExpression('age > 18'), true);
      expect(engine.evaluateExpression('age < 18'), false);
    });
  });

  group('DataBinder', () {
    test('Binds template data', () {
      final engine = ExpressionEngine(data: {'userName': 'Bob', 'isChecked': 'true'});
      final binder = DataBinder(engine);

      const template = Template(
        version: '1.0',
        pages: [
          PageSchema(
            id: 'p1',
            width: 100,
            height: 100,
            fields: [
              FieldSchema(
                id: 'f1',
                type: 'text_field',
                x: 0,
                y: 0,
                width: 50,
                height: 20,
                data: {'value': '{{userName}}'},
              ),
              FieldSchema(
                id: 'f2',
                type: 'checkbox',
                x: 0,
                y: 20,
                width: 20,
                height: 20,
                data: {'value': '{{isChecked}}'},
              ),
            ],
          ),
        ],
      );

      final bound = binder.bindTemplate(template);
      expect(bound.pages.first.fields[0].data['value'], 'Bob');
      expect(bound.pages.first.fields[1].data['value'], 'true');
    });
  });
}
