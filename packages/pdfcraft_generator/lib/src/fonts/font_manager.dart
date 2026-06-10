import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;

/// Manages custom TTF/OTF fonts for PDF generation.
class FontManager {
  FontManager._();

  static final FontManager instance = FontManager._();

  final Map<String, pw.Font> _fonts = {};

  /// Registers a custom TTF/OTF font from bytes.
  void registerFont(String familyName, Uint8List fontBytes) {
    final font = pw.Font.ttf(fontBytes.buffer.asByteData());
    _fonts[familyName] = font;
  }

  /// Retrieves a registered font, or returns null if not found.
  pw.Font? getFont(String familyName) {
    return _fonts[familyName];
  }
}
