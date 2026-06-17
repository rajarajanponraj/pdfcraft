import 'package:flutter/foundation.dart';
import 'package:pdfcraft_core/pdfcraft_core.dart';

/// Manages the state of the PDF template being designed.
class DesignerController extends ChangeNotifier {
  DesignerController({
    required Template initialTemplate,
  })  : _template = initialTemplate,
        _activePageId = initialTemplate.pages.isNotEmpty
            ? initialTemplate.pages.first.id
            : 'default_page_id' {
    _history.add(_template);
  }

  final List<Template> _history = [];
  int _historyIndex = 0;
  Template _template;
  String _activePageId;
  String? _selectedFieldId;
  bool _enableSnapping = true;
  double _gridSize = 10;

  Template get template => _template;
  String get activePageId => _activePageId;
  String? get selectedFieldId => _selectedFieldId;
  bool get enableSnapping => _enableSnapping;
  double get gridSize => _gridSize;

  final List<double> _verticalGuidelines = [];
  final List<double> _horizontalGuidelines = [];

  List<double> get verticalGuidelines => _verticalGuidelines;
  List<double> get horizontalGuidelines => _horizontalGuidelines;

  bool get canUndo => _historyIndex > 0;
  bool get canRedo => _historyIndex < _history.length - 1;

  void undo() {
    if (canUndo) {
      _historyIndex--;
      _template = _history[_historyIndex];
      _selectedFieldId = null;
      notifyListeners();
    }
  }

  void redo() {
    if (canRedo) {
      _historyIndex++;
      _template = _history[_historyIndex];
      _selectedFieldId = null;
      notifyListeners();
    }
  }

  void commitAction() {
    if (_historyIndex < _history.length - 1) {
      _history.removeRange(_historyIndex + 1, _history.length);
    }
    if (_history.isNotEmpty && _history.last == _template) return;

    _history.add(_template);
    if (_history.length > 50) {
      _history.removeAt(0);
    } else {
      _historyIndex++;
    }
    notifyListeners();
  }

  // ignore: avoid_positional_boolean_parameters
  void toggleSnapping(bool value) {
    _enableSnapping = value;
    notifyListeners();
  }

  FieldSchema? _clipboard;

  void copySelectedField() {
    if (_selectedFieldId != null) {
      _clipboard = selectedField;
    }
  }

  void pasteField() {
    if (_clipboard != null) {
      final newId = 'field_${DateTime.now().microsecondsSinceEpoch}';
      final pastedField = _clipboard!.copyWith(
        id: newId,
        x: _clipboard!.x + 10,
        y: _clipboard!.y + 10,
      );
      addField(pastedField);
    }
  }

  void duplicateSelectedField() {
    copySelectedField();
    pasteField();
  }

  void setGridSize(double size) {
    _gridSize = size;
    notifyListeners();
  }

  PageSchema? get activePage {
    try {
      return _template.pages.firstWhere((page) => page.id == _activePageId);
    } catch (e) {
      return null;
    }
  }

  FieldSchema? get selectedField {
    if (_selectedFieldId == null) return null;
    final page = activePage;
    if (page == null) return null;

    try {
      return page.fields.firstWhere((f) => f.id == _selectedFieldId);
    } catch (e) {
      return null;
    }
  }

  void selectField(String? id) {
    if (_selectedFieldId != id) {
      _selectedFieldId = id;
      notifyListeners();
    }
  }

  void setActivePage(String pageId) {
    if (_activePageId != pageId) {
      _activePageId = pageId;
      _selectedFieldId = null; // Clear selection on page change
      notifyListeners();
    }
  }

  void addField(FieldSchema field) {
    final page = activePage;
    if (page == null) return;

    final updatedPage = page.copyWith(fields: [...page.fields, field]);
    _updatePage(updatedPage);
    _selectedFieldId = field.id;
    commitAction();
    notifyListeners();
  }

  void updateField(FieldSchema field) {
    _updateFieldInternal(field);
    _verticalGuidelines.clear();
    _horizontalGuidelines.clear();
    commitAction();
    notifyListeners();
  }

  void updateFieldWithGuidelines(FieldSchema field) {
    final page = activePage;
    if (page == null) return;

    _verticalGuidelines.clear();
    _horizontalGuidelines.clear();

    var newX = field.x;
    var newY = field.y;
    const snapThreshold = 5.0;

    if (_enableSnapping) {
      for (final other in page.fields) {
        if (other.id == field.id) continue;

        // Vertical snapping (X axis)
        if ((field.x - other.x).abs() < snapThreshold) {
          newX = other.x;
          _verticalGuidelines.add(newX);
        } else if ((field.x + field.width - (other.x + other.width)).abs() <
            snapThreshold) {
          newX = other.x + other.width - field.width;
          _verticalGuidelines.add(other.x + other.width);
        } else if ((field.x - (other.x + other.width)).abs() < snapThreshold) {
          newX = other.x + other.width;
          _verticalGuidelines.add(newX);
        }

        // Horizontal snapping (Y axis)
        if ((field.y - other.y).abs() < snapThreshold) {
          newY = other.y;
          _horizontalGuidelines.add(newY);
        } else if ((field.y + field.height - (other.y + other.height)).abs() <
            snapThreshold) {
          newY = other.y + other.height - field.height;
          _horizontalGuidelines.add(other.y + other.height);
        } else if ((field.y - (other.y + other.height)).abs() < snapThreshold) {
          newY = other.y + other.height;
          _horizontalGuidelines.add(newY);
        }
      }
    }

    final updatedField = field.copyWith(x: newX, y: newY);
    _updateFieldInternal(updatedField);
    notifyListeners();
  }

  void clearGuidelines() {
    _verticalGuidelines.clear();
    _horizontalGuidelines.clear();
    notifyListeners();
  }

  void _updateFieldInternal(FieldSchema field) {
    final page = activePage;
    if (page == null) return;

    final updatedFields = page.fields.map((f) {
      return f.id == field.id ? field : f;
    }).toList();

    final updatedPage = page.copyWith(fields: updatedFields);
    _updatePage(updatedPage);
  }

  void deleteSelectedField() {
    if (_selectedFieldId == null) return;

    final page = activePage;
    if (page == null) return;

    final updatedFields =
        page.fields.where((f) => f.id != _selectedFieldId).toList();
    final updatedPage = page.copyWith(fields: updatedFields);
    _updatePage(updatedPage);

    _selectedFieldId = null;
    commitAction();
    notifyListeners();
  }

  void _updatePage(PageSchema newPage) {
    final updatedPages = _template.pages.map((p) {
      return p.id == newPage.id ? newPage : p;
    }).toList();
    _template = _template.copyWith(pages: updatedPages);
  }
}
