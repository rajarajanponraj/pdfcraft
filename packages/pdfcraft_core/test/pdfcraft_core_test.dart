import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pdfcraft_core/pdfcraft_core.dart';

class MockPlugin extends PdfCraftPlugin {
  @override
  String get name => 'mock';

  String? savedData;

  @override
  Widget designerWidget() => const SizedBox();

  @override
  Widget formWidget() => const SizedBox();

  @override
  void renderPdf() {}

  @override
  Map<String, dynamic> serialize() => {'savedData': savedData};

  @override
  void deserialize(Map<String, dynamic> json) {
    savedData = json['savedData'] as String?;
  }

  @override
  bool validate() => true;
}

void main() {
  group('Schema Models', () {
    test('Template JSON serialization', () {
      const template = Template(
        version: '1.0',
        pages: [
          PageSchema(
            id: 'page1',
            width: 595,
            height: 842,
            fields: [
              FieldSchema(
                id: 'field1',
                type: 'mock',
                x: 10,
                y: 10,
                width: 100,
                height: 50,
                data: {'text': 'Hello World'},
                style: StyleSchema(fillColor: '#FFFFFF'),
              ),
            ],
          ),
        ],
        plugins: [
          PluginSchema(name: 'mock', version: '1.0.0'),
        ],
      );

      final json = template.toJson();
      expect(json['version'], '1.0');

      final parsed = Template.fromJson(json);
      expect(parsed, equals(template));
      expect(parsed.pages.first.fields.first.style?.fillColor, '#FFFFFF');
    });
  });

  group('PluginRegistry', () {
    test('Register and create plugin', () {
      final registry = PluginRegistry.instance;
      registry.register('mock', () => MockPlugin());

      final plugin = registry.create('mock', {'savedData': 'test'}) as MockPlugin?;
      
      expect(plugin, isNotNull);
      expect(plugin?.name, 'mock');
      expect(plugin?.savedData, 'test');
      
      registry.unregister('mock');
      final notFound = registry.create('mock');
      expect(notFound, isNull);
    });
  });

  group('TemplateCodec', () {
    test('encode and decode work symmetrically', () {
      const template = Template(
        version: '1.0',
        pages: [
          PageSchema(
            id: 'page1',
            width: 200,
            height: 200,
            fields: [
              FieldSchema(
                id: 'field1',
                type: 'text',
                x: 10,
                y: 10,
                width: 100,
                height: 50,
                data: {'text': 'Hello'},
              )
            ],
          )
        ],
      );

      final jsonString = TemplateCodec.encode(template);
      expect(jsonString, isNotEmpty);
      expect(jsonString.contains('"version": "1.0"'), isTrue);
      expect(jsonString.contains('"id": "page1"'), isTrue);

      final decoded = TemplateCodec.decode(jsonString);
      expect(decoded.version, '1.0');
      expect(decoded.pages.first.fields.first.data['text'], 'Hello');
    });
  });
}
