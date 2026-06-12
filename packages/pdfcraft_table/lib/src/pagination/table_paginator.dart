import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_form/pdfcraft_form.dart';

class TablePaginator {

  TablePaginator(this.engine);
  final ExpressionEngine engine;

  Template paginateTemplate(Template template) {
    final newPages = <PageSchema>[];
    
    for (final page in template.pages) {
      newPages.addAll(_paginatePage(page));
    }
    
    return template.copyWith(pages: newPages);
  }

  List<PageSchema> _paginatePage(PageSchema page) {
    // Support only 1 table per page for now to avoid exponential combinatorial explosion
    final tableFieldIdx = page.fields.indexWhere((f) => f.type == 'table');
    if (tableFieldIdx == -1) return [page];

    final tableField = page.fields[tableFieldIdx];
    
    // itemsExpr contains the raw string to evaluate, e.g. "users"
    final itemsExpr = tableField.data['itemsExpr'];
    if (itemsExpr == null) return [page];

    final rawItems = engine.evaluateExpression(itemsExpr.toString());
    if (rawItems is! List) {
      // If it's not a list, just return the page with empty items
      return [_bindItems(page, tableFieldIdx, [])];
    }

    // Estimate Row Height
    // In a real advanced system, this would ask `pw.Table` for metrics.
    // For v1.0.0, we use a simple heuristic: 20px per row + 25px header.
    const rowHeight = 20.0;
    const headerHeight = 25.0;
    final availableHeight = tableField.height - headerHeight;
    final rowsPerPage = (availableHeight / rowHeight).floor();

    if (rowsPerPage <= 0 || rawItems.length <= rowsPerPage) {
      // Fits on a single page
      return [_bindItems(page, tableFieldIdx, rawItems)];
    }

    // Needs pagination
    final result = <PageSchema>[];
    for (var i = 0; i < rawItems.length; i += rowsPerPage) {
      final chunk = rawItems.skip(i).take(rowsPerPage).toList();
      
      // Clone the page, and swap the table field's items with the chunk
      result.add(_bindItems(page, tableFieldIdx, chunk));
    }

    return result;
  }

  PageSchema _bindItems(PageSchema page, int tableIndex, List<dynamic> items) {
    final tableField = page.fields[tableIndex];
    final boundData = Map<String, dynamic>.from(tableField.data);
    boundData['items'] = items;
    
    final newField = tableField.copyWith(data: boundData);
    final newFields = List<FieldSchema>.from(page.fields);
    newFields[tableIndex] = newField;
    
    return page.copyWith(fields: newFields);
  }
}
