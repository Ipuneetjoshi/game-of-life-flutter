// Abstract base class for grid states (used for state management)
abstract class GridState {
  String type;

  GridState(this.type);
}

// Represents the initial state of the grid
class GridStateInitial extends GridState {
  @override
  String get type;

  GridStateInitial(String type) : super(type);
}

// Represents the paused state of the grid
class GridStatePaused extends GridState {
  @override
  String get type;

  GridStatePaused(String type) : super(type);
}

// Represents the play state of the grid
class GridStatePlay extends GridState {
  @override
  String get type;

  GridStatePlay(String type) : super(type);
}

// Represents the running state of the grid
class GridStateRunning extends GridState {
  @override
  String get type;

  GridStateRunning(String type) : super(type);
}

// Represents the restart state of the grid
class GridStateReStart extends GridState {
  @override
  String get type;

  GridStateReStart(String type) : super(type);
}
