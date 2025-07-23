import 'dart:async';

import 'package:game_of_life_starter_code/game_engine/game_engine.dart';
import 'package:game_of_life_starter_code/grid_manager/grid_manager.dart';
import 'package:game_of_life_starter_code/grid_manager/grid_state.dart';

// Controller class manages the game state, streams, and timer
class Controller {
  late Timer _timer;

  // Stream for broadcasting the current generation count
  final StreamController<int> _generationController =
      StreamController<int>.broadcast();
  StreamSink<int> get generationSink => _generationController.sink;
  Stream<int> get generationStream => _generationController.stream;

  // Stream for broadcasting the current grid state
  final StreamController<List<List<int>>> _tickerController =
      StreamController<List<List<int>>>.broadcast();
  StreamSink<List<List<int>>> get counterSink => _tickerController.sink;
  Stream<List<List<int>>> get counterStream => _tickerController.stream;

  // Stream for handling game events (play, pause, etc.)
  final StreamController<GridState> _eventController =
      StreamController<GridState>.broadcast();
  StreamSink<GridState> get eventSink => _eventController.sink;
  Stream<GridState> get eventStream => _eventController.stream;

  // GridManager handles the grid data
  GridManager manager = GridManager(GridStateInitial("random"));
  late GameEngine engine;
  StreamSubscription? listener;

  bool isRunning = false;

  Controller() {
    engine = GameEngine(manager);
    // Start with the initial state
    eventSink.add(GridStateInitial("random"));
    // Listen for game state events
    listener = eventStream.listen((GridState event) {
      if (event is GridStateInitial) {
        // handle initial state
      } else if (event is GridStatePaused) {
        isRunning = false;
        // handle paused state
      } else if (event is GridStateReStart) {
        manager.grid.clear();
        manager.initializeGrid(30, 30);
      } else if (event is GridStatePlay) {
        isRunning = true;
      } else {}
    });
    // Timer to update the game every second if running
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (!isRunning) return;
      engine.nextGeneration();
      generationSink.add(engine.generationCount);
      counterSink.add(manager.grid);
    });
  }

  // Clean up resources
  void onDestroy() {
    _timer.cancel();
    _tickerController.close();
    _eventController.close();
  }
}
