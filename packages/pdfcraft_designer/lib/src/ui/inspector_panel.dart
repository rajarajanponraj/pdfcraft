import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pdfcraft_designer/src/state/designer_state.dart';

class InspectorPanel extends StatelessWidget {

  const InspectorPanel({
    super.key,
    required this.controller,
  });
  final DesignerController controller;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final field = controller.selectedField;

        if (field == null) {
          return const Center(
            child: Text('Select a field to inspect'),
          );
        }

        return Container(
          width: 300,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.grey.shade100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Inspector',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: controller.deleteSelectedField,
                      tooltip: 'Delete Field',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text('Type: ${field.type}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('ID: ${field.id}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    const Divider(height: 32),
                    
                    _PropertyInput(
                      label: 'X Position',
                      value: field.x,
                      onChanged: (val) {
                        controller.updateField(field.copyWith(x: val));
                      },
                    ),
                    _PropertyInput(
                      label: 'Y Position',
                      value: field.y,
                      onChanged: (val) {
                        controller.updateField(field.copyWith(y: val));
                      },
                    ),
                    _PropertyInput(
                      label: 'Width',
                      value: field.width,
                      onChanged: (val) {
                        controller.updateField(field.copyWith(width: val));
                      },
                    ),
                    _PropertyInput(
                      label: 'Height',
                      value: field.height,
                      onChanged: (val) {
                        controller.updateField(field.copyWith(height: val));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PropertyInput extends StatefulWidget {

  const _PropertyInput({
    required this.label,
    required this.value,
    required this.onChanged,
  });
  final String label;
  final double value;
  final ValueChanged<double> onChanged;

  @override
  State<_PropertyInput> createState() => _PropertyInputState();
}

class _PropertyInputState extends State<_PropertyInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value.toStringAsFixed(1));
  }

  @override
  void didUpdateWidget(covariant _PropertyInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Only update if it's significantly different, to prevent jumping cursor
    final currentVal = double.tryParse(_controller.text);
    if (currentVal != null && (currentVal - widget.value).abs() > 0.01) {
      _controller.text = widget.value.toStringAsFixed(1);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: widget.label,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        ],
        onChanged: (val) {
          final number = double.tryParse(val);
          if (number != null) {
            widget.onChanged(number);
          }
        },
      ),
    );
  }
}
