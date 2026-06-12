import 'package:flutter/material.dart';
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_designer/pdfcraft_designer.dart';

void main() {
  runApp(const DesignerExampleApp());
}

class DesignerExampleApp extends StatelessWidget {
  const DesignerExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDFCraft Designer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DesignerScreen(),
    );
  }
}

class DesignerScreen extends StatefulWidget {
  const DesignerScreen({super.key});

  @override
  State<DesignerScreen> createState() => _DesignerScreenState();
}

class _DesignerScreenState extends State<DesignerScreen> {
  late final DesignerController _controller;

  @override
  void initState() {
    super.initState();
    // Create a mock template
    const template = Template(
      version: '1.0',
      pages: [
        PageSchema(
          id: 'page_1',
          width: 595, // A4 Width at 72 PPI
          height: 842, // A4 Height at 72 PPI
          fields: [
            FieldSchema(
              id: 'text_1',
              type: 'text',
              x: 100,
              y: 100,
              width: 200,
              height: 50,
              data: {'text': 'Hello PDFCraft!'},
            ),
            FieldSchema(
              id: 'rect_1',
              type: 'rectangle',
              x: 300,
              y: 200,
              width: 100,
              height: 100,
              data: {'color': '#FF0000'},
            ),
          ],
        ),
      ],
    );

    _controller = DesignerController(initialTemplate: template);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDFCraft Designer Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Row(
        children: [
          Expanded(
            child: DesignerCanvas(controller: _controller),
          ),
          const VerticalDivider(width: 1, thickness: 1),
          InspectorPanel(controller: _controller),
        ],
      ),
    );
  }
}
