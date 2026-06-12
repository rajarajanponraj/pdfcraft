import 'package:flutter/material.dart';
import 'package:pdfcraft_designer/src/state/designer_state.dart';
import 'package:pdfcraft_designer/src/ui/field_widget.dart';

class DesignerCanvas extends StatelessWidget {

  const DesignerCanvas({
    super.key,
    required this.controller,
  });
  final DesignerController controller;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final page = controller.activePage;

        if (page == null) {
          return const Center(child: Text('No active page'));
        }

        return GestureDetector(
          onTap: () {
            // Deselect field when tapping outside
            controller.selectField(null);
          },
          child: ColoredBox(
            color: Colors.grey.shade200,
            child: InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(double.infinity),
              minScale: 0.1,
              maxScale: 4,
              constrained: false, // Allows panning outside the container bounds
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
                          controller: controller,
                        );
                      }),
                      // Vertical Guidelines
                      for (final x in controller.verticalGuidelines)
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
                      for (final y in controller.horizontalGuidelines)
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
        );
      },
    );
  }
}
