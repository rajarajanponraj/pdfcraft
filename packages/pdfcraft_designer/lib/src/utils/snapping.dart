// Utility functions for grid snapping.


class SnappingUtils {
  /// Snaps the [value] to the nearest multiple of [gridSize].
  static double snap(double value, double gridSize) {
    if (gridSize <= 0) return value;
    return (value / gridSize).round() * gridSize;
  }
}
