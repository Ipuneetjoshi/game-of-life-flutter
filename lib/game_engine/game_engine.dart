import 'package:game_of_life_starter_code/grid_manager/grid_manager.dart';

// GameEngine contains the core logic for Conway's Game of Life
class GameEngine {
  final GridManager _manager;
  final int _alive = 1;
  final int _dead = 0;

  var generationCount = 0; // Tracks the current generation

  GameEngine(this._manager);

  // Advances the game by one generation
  void nextGeneration() {
    generationCount++;
    var _rows = _manager.grid.length;
    var _columns = _manager.grid[0].length;
    // Create a new grid for the next generation
    List<List<int>> nextGrid =
        List.generate(_rows, (_) => List.filled(_columns, 0));
    for (int i = 0; i < _rows; i++) {
      for (int j = 0; j < _columns; j++) {
        int neighbors = _countAliveNeighbors(i, j);
        // Apply Conway's rules
        if (_manager.grid[i][j] == _alive) {
          if (neighbors == 2 || neighbors == 3) {
            nextGrid[i][j] = _alive;
          } else {
            nextGrid[i][j] = _dead;
          }
        } else {
          if (neighbors == 3) {
            nextGrid[i][j] = _alive;
          } else {
            nextGrid[i][j] = _dead;
          }
        }
      }
    }
    _manager.grid = nextGrid;
  }

  // Counts the number of alive neighbors for a given cell
  int _countAliveNeighbors(int row, int column) {
    int count = 0;
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if (i == 0 && j == 0) continue; // Skip the cell itself
        int r = row + i;
        int c = column + j;
        // Check boundaries and count alive neighbors
        if (r >= 0 &&
            r < _manager.grid.length &&
            c >= 0 &&
            c < _manager.grid[0].length &&
            _manager.grid[r][c] == _alive) {
          count++;
        }
      }
    }
    return count;
  }
}
