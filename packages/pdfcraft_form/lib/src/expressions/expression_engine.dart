import 'package:petitparser/petitparser.dart';

/// A simple expression engine using petitparser for data binding and conditional logic.
class ExpressionEngine {

  ExpressionEngine({this.data = const {}});
  final Map<String, dynamic> data;

  /// Evaluates an interpolated string (e.g., "Hello {{user.name}}") and returns the result.
  String evaluateInterpolatedString(String input) {
    if (!input.contains('{{')) return input;

    final builder = StringBuffer();
    var lastMatchEnd = 0;

    final regex = RegExp(r'\{\{(.*?)\}\}');
    for (final match in regex.allMatches(input)) {
      builder.write(input.substring(lastMatchEnd, match.start));
      final expr = match.group(1)?.trim() ?? '';
      
      final result = evaluateExpression(expr);
      builder.write(result?.toString() ?? '');
      
      lastMatchEnd = match.end;
    }

    builder.write(input.substring(lastMatchEnd));
    return builder.toString();
  }

  /// Evaluates a logical or data lookup expression (e.g., "user.age > 18" or "user.name")
  dynamic evaluateExpression(String expr) {
    final parser = _buildParser();
    final result = parser.parse(expr.trim());
    if (result is Success) {
      return result.value;
    }
    return null; // Return null if parsing fails
  }

  Parser _buildParser() {
    final builder = ExpressionBuilder<dynamic>();

    // Basic Types
    builder
      ..primitive(digit().plus().seq(char('.').seq(digit().plus()).optional()).flatten().trim().map((a) {
        if (a.contains('.')) return double.parse(a);
        return int.parse(a);
      }),)
      ..primitive((string("'") & any().starLazy(string("'")).flatten() & string("'")).trim().map((a) => a[1]))
      ..primitive((string('"') & any().starLazy(string('"')).flatten() & string('"')).trim().map((a) => a[1]))
      ..primitive(string('true').trim().map((_) => true))
      ..primitive(string('false').trim().map((_) => false))
      ..primitive(_buildVariableParser().trim());

    // Parentheses
    builder.group().wrapper(char('(').trim(), char(')').trim(), (left, value, right) => value);

    // Relational operators
    builder.group()
      ..left(string('==').trim(), (a, op, b) => a == b)
      ..left(string('!=').trim(), (a, op, b) => a != b)
      ..left(string('>=').trim(), (a, op, b) => (a as num) >= (b as num))
      ..left(string('<=').trim(), (a, op, b) => (a as num) <= (b as num))
      ..left(string('>').trim(), (a, op, b) => (a as num) > (b as num))
      ..left(string('<').trim(), (a, op, b) => (a as num) < (b as num));

    // Logical operators
    builder.group()
      ..left(string('&&').trim(), (a, op, b) => (a as bool) && (b as bool))
      ..left(string('||').trim(), (a, op, b) => (a as bool) || (b as bool));

    return builder.build().end();
  }

  Parser _buildVariableParser() {
    return letter().seq(word().or(char('.')).star()).flatten().map(_resolveDataPath);
  }

  dynamic _resolveDataPath(String path) {
    final keys = path.split('.');
    dynamic current = data;

    for (final key in keys) {
      if (current is Map<String, dynamic> && current.containsKey(key)) {
        current = current[key];
      } else {
        return null;
      }
    }
    return current;
  }
}
