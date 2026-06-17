import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdfcraft_designer/src/state/designer_state.dart';
import 'package:pdfcraft_designer/src/ui/field_widget.dart';

class DesignerCanvas extends StatefulWidget {
  const DesignerCanvas({
    super.key,
    required this.controller,
  });

  final DesignerController controller;

  @override
  State<DesignerCanvas> createState() => _DesignerCanvasState();
}

class _DesignerCanvasState extends State<DesignerCanvas> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, _) {
        final page = widget.controller.activePage;

        if (page == null) {
          return const Center(child: Text('No active page'));
        }

        return Focus(
          focusNode: _focusNode,
          autofocus: true,
          onKeyEvent: (node, event) {
            if (event is KeyDownEvent) {
              if (event.logicalKey == LogicalKeyboardKey.delete ||
                  event.logicalKey == LogicalKeyboardKey.backspace) {
                widget.controller.deleteSelectedField();
                return KeyEventResult.handled;
              }
              final isCtrl = HardwareKeyboard.instance.isControlPressed ||
                  HardwareKeyboard.instance.isMetaPressed;

              if (isCtrl) {
                if (event.logicalKey == LogicalKeyboardKey.keyZ) {
                  if (HardwareKeyboard.instance.isShiftPressed) {
                    widget.controller.redo();
                  } else {
                    widget.controller.undo();
                  }
                  return KeyEventResult.handled;
                }
                if (event.logicalKey == LogicalKeyboardKey.keyY) {
                  widget.controller.redo();
                  return KeyEventResult.handled;
                }
                if (event.logicalKey == LogicalKeyboardKey.keyC) {
                  widget.controller.copySelectedField();
                  return KeyEventResult.handled;
                }
                if (event.logicalKey == LogicalKeyboardKey.keyV) {
                  widget.controller.pasteField();
                  return KeyEventResult.handled;
                }
                if (event.logicalKey == LogicalKeyboardKey.keyD) {
                  widget.controller.duplicateSelectedField();
                  return KeyEventResult.handled;
                }
              }
            }
            return KeyEventResult.ignored;
          },
          child: GestureDetector(
            onTap: () {
              // Deselect field when tapping outside
              _focusNode.requestFocus();
              widget.controller.selectField(null);
            },
            child: ColoredBox(
              color: Colors.grey.shade200,
              child: InteractiveViewer(
                boundaryMargin: const EdgeInsets.all(double.infinity),
                minScale: 0.1,
                maxScale: 4,
                constrained:
                    false, // Allows panning outside the container bounds
                child: Center(
                  child: Container(
                    width: page.width,
                    height: page.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ...page.fields.map((field) {
                          return FieldWidget(
                            key: ValueKey(field.id),
                            field: field,
                            controller: widget.controller,
                          );
                        }),
                        // Vertical Guidelines
                        for (final x in widget.controller.verticalGuidelines)
                          Positioned(
                            left: x,
                            top: 0,
                            bottom: 0,
                            child: Container(
                              width: 1,
                              color: Colors.pinkAccent.withValues(alpha: 0.8),
                            ),
                          ),
                        // Horizontal Guidelines
                        for (final y in widget.controller.horizontalGuidelines)
                          Positioned(
                            top: y,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 1,
                              color: Colors.pinkAccent.withValues(alpha: 0.8),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
