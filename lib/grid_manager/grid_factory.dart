import 'dart:math';

// GridFactory creates different types of initial grids
class GridFactory {
  // Creates a grid based on the specified type
  static List<List<int>> create(String type, int rows, int cols) {
    switch (type) {
      case 'random':
        return _createRandomGrid(rows, cols);
      case 'empty':
        return _createEmptyGrid(rows, cols);
      case 'glider':
        return _createGliderGrid(rows, cols);
      default:
        return _createRandomGrid(rows, cols);
    }
  }

  // Creates a grid with random live/dead cells
  static List<List<int>> _createRandomGrid(int rows, int cols) {
    return List.generate(
        rows, (_) => List.generate(cols, (_) => Random().nextBool() ? 1 : 0));
  }

  // Creates an empty grid (all cells dead)
  static List<List<int>> _createEmptyGrid(int rows, int cols) {
    return List.generate(rows, (_) => List.generate(cols, (_) => 0));
  }

  // Creates a grid with a glider pattern (currently returns empty grid)
  static List<List<int>> _createGliderGrid(int rows, int cols) {
    // TODO: Implement actual glider pattern
    return List.generate(rows, (_) => List.generate(cols, (_) => 0));
  }
}
