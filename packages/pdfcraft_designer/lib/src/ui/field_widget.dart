import 'package:flutter/material.dart';
import 'package:pdfcraft_core/pdfcraft_core.dart';
import 'package:pdfcraft_designer/src/state/designer_state.dart';
import 'package:pdfcraft_designer/src/utils/snapping.dart';

class FieldWidget extends StatefulWidget {

  const FieldWidget({
    super.key,
    required this.field,
    required this.controller,
  });
  final FieldSchema field;
  final DesignerController controller;

  @override
  State<FieldWidget> createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  double _originalX = 0;
  double _originalY = 0;
  double _originalWidth = 0;
  double _originalHeight = 0;
  double _totalDx = 0;
  double _totalDy = 0;

  void _onPanStart(DragStartDetails details) {
    _originalX = widget.field.x;
    _originalY = widget.field.y;
    _totalDx = 0;
    _totalDy = 0;
    widget.controller.selectField(widget.field.id);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _totalDx += details.delta.dx;
    _totalDy += details.delta.dy;

    var targetX = _originalX + _totalDx;
    var targetY = _originalY + _totalDy;

    if (widget.controller.enableSnapping) {
      targetX = SnappingUtils.snap(targetX, widget.controller.gridSize);
      targetY = SnappingUtils.snap(targetY, widget.controller.gridSize);
    }

    widget.controller.updateFieldWithGuidelines(widget.field.copyWith(x: targetX, y: targetY));
  }

  void _onPanEnd(DragEndDetails details) {
    widget.controller.clearGuidelines();
  }

  void _onResizeStart(DragStartDetails details) {
    _originalX = widget.field.x;
    _originalY = widget.field.y;
    _originalWidth = widget.field.width;
    _originalHeight = widget.field.height;
    _totalDx = 0;
    _totalDy = 0;
    widget.controller.selectField(widget.field.id);
  }

  void _onResizeUpdate(DragUpdateDetails details, Alignment align) {
    _totalDx += details.delta.dx;
    _totalDy += details.delta.dy;

    var newX = _originalX;
    var newY = _originalY;
    var newW = _originalWidth;
    var newH = _originalHeight;

    if (align == Alignment.topLeft) {
      newX += _totalDx;
      newY += _totalDy;
      newW -= _totalDx;
      newH -= _totalDy;
    } else if (align == Alignment.topCenter) {
      newY += _totalDy;
      newH -= _totalDy;
    } else if (align == Alignment.topRight) {
      newY += _totalDy;
      newW += _totalDx;
      newH -= _totalDy;
    } else if (align == Alignment.centerLeft) {
      newX += _totalDx;
      newW -= _totalDx;
    } else if (align == Alignment.centerRight) {
      newW += _totalDx;
    } else if (align == Alignment.bottomLeft) {
      newX += _totalDx;
      newW -= _totalDx;
      newH += _totalDy;
    } else if (align == Alignment.bottomCenter) {
      newH += _totalDy;
    } else if (align == Alignment.bottomRight) {
      newW += _totalDx;
      newH += _totalDy;
    }

    if (widget.controller.enableSnapping) {
      newX = SnappingUtils.snap(newX, widget.controller.gridSize);
      newY = SnappingUtils.snap(newY, widget.controller.gridSize);
      newW = SnappingUtils.snap(newW, widget.controller.gridSize);
      newH = SnappingUtils.snap(newH, widget.controller.gridSize);
    }

    if (newW < 10) newW = 10;
    if (newH < 10) newH = 10;

    widget.controller.updateFieldWithGuidelines(widget.field.copyWith(
      x: newX,
      y: newY,
      width: newW,
      height: newH,
    ),);
  }

  void _onResizeEnd(DragEndDetails details) {
    widget.controller.clearGuidelines();
  }

  @override
  Widget build(BuildContext context) {
    final isSelected = widget.controller.selectedFieldId == widget.field.id;

    return Positioned(
      left: widget.field.x,
      top: widget.field.y,
      width: widget.field.width,
      height: widget.field.height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main Body
          Positioned.fill(
            child: GestureDetector(
              onTapDown: (_) {
                widget.controller.selectField(widget.field.id);
              },
              onPanStart: _onPanStart,
              onPanUpdate: _onPanUpdate,
              onPanEnd: _onPanEnd,
              child: Container(
                decoration: BoxDecoration(
                  border: isSelected
                      ? Border.all(color: Colors.blueAccent, width: 2)
                      : Border.all(color: Colors.grey.shade400),
                  color: Colors.white.withValues(alpha: 0.8),
                ),
                child: Center(
                  child: Text(
                    '${widget.field.type}\n${widget.field.id.substring(0, 4)}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 10, color: Colors.black54),
                  ),
                ),
              ),
            ),
          ),
          // Resize Handles
          if (isSelected) ...[
            _buildHandle(Alignment.topLeft),
            _buildHandle(Alignment.topCenter),
            _buildHandle(Alignment.topRight),
            _buildHandle(Alignment.centerLeft),
            _buildHandle(Alignment.centerRight),
            _buildHandle(Alignment.bottomLeft),
            _buildHandle(Alignment.bottomCenter),
            _buildHandle(Alignment.bottomRight),
          ],
        ],
      ),
    );
  }

  Widget _buildHandle(Alignment align) {
    const double size = 10;
    return Align(
      alignment: align,
      child: GestureDetector(
        onPanStart: _onResizeStart,
        onPanUpdate: (details) => _onResizeUpdate(details, align),
        onPanEnd: _onResizeEnd,
        child: FractionalTranslation(
          // Offset the handle so it sits exactly on the border
          translation: Offset(align.x * 0.5, align.y * 0.5),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blueAccent, width: 1.5),
            ),
          ),
        ),
      ),
    );
  }
}
