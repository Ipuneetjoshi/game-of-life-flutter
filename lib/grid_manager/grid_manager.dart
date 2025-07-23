import 'package:game_of_life_starter_code/grid_manager/grid_factory.dart';
import 'package:game_of_life_starter_code/grid_manager/grid_state.dart';

// GridManager manages the current grid and its state
class GridManager {
  // Initialize with a given state
  GridManager(GridState state) : _state = state {
    initializeGrid(30, 30);
  }

  late GridState _state;
  List<List<int>> _grid = [];

  // Update the grid state and reinitialize
  void setState(GridState state) {
    _state = state;
    initializeGrid(30, 30);
  }

  // Get the current grid
  List<List<int>> get grid => _grid;

  // Set the current grid
  set grid(List<List<int>> data) => _grid = data;

  // Initialize the grid using the factory
  void initializeGrid(int rows, int cols) {
    _grid = GridFactory.create(_state.type, rows, cols);
  }
}
