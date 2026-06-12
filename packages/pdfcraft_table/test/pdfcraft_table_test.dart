import 'package:flutter_test/flutter_test.dart';
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_form/pdfcraft_form.dart';
import 'package:pdfcraft_table/pdfcraft_table.dart';

void main() {
  group('TablePaginator', () {
    test('Splits overflowing table into multiple pages', () {
      final engine = ExpressionEngine(data: {
        'users': List.generate(50, (i) => {'name': 'User $i', 'age': 20 + i}),
      },);

      final paginator = TablePaginator(engine);

      const template = Template(
        version: '1.0',
        pages: [
          PageSchema(
            id: 'p1',
            width: 500,
            height: 500,
            fields: [
              FieldSchema(
                id: 't1',
                type: 'table',
                x: 0,
                y: 0,
                width: 400,
                height: 225, // Header 25px + 10 rows * 20px = 225px. So 10 rows per page.
                data: {
                  'columns': ['name', 'age'],
                  'itemsExpr': 'users',
                },
              ),
              FieldSchema(
                id: 'static_text',
                type: 'text',
                x: 0,
                y: 400,
                width: 100,
                height: 20,
                data: {},
              ),
            ],
          ),
        ],
      );

      final paginated = paginator.paginateTemplate(template);

      // 50 users / 10 rows per page = 5 pages
      expect(paginated.pages.length, 5);

      // Verify page clones have the static text
      expect(paginated.pages[0].fields[1].id, 'static_text');
      expect(paginated.pages[4].fields[1].id, 'static_text');

      // Verify the table items chunking
      final page1Table = paginated.pages[0].fields[0];
      final page1Items = page1Table.data['items'] as List;
      expect(page1Items.length, 10);
      expect((page1Items.first as Map)['name'], 'User 0');

      final page5Table = paginated.pages[4].fields[0];
      final page5Items = page5Table.data['items'] as List;
      expect(page5Items.length, 10);
      expect((page5Items.last as Map)['name'], 'User 49');
    });
  });
}
