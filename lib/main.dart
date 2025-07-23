// Main entry point for the Flutter app
import 'package:flutter/material.dart';
import 'package:game_of_life_starter_code/controller/controller.dart';
import 'package:game_of_life_starter_code/grid_manager/grid_state.dart';

void main() {
  // Start the app with the GameOfLife widget as the home screen
  runApp(
    const MaterialApp(home: GameOfLife()),
  );
}

// Main widget for the Game of Life app
class GameOfLife extends StatefulWidget {
  const GameOfLife({Key? key}) : super(key: key);

  @override
  _GameOfLifeState createState() => _GameOfLifeState();
}

class _GameOfLifeState extends State<GameOfLife> {
  // Controller manages the game logic and state
  final Controller _controller = Controller();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Display the current generation using a stream
        title: StreamBuilder<int>(
            stream: _controller.generationStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Generation:  ${snapshot.data}');
              } else {
                return const Text('Generation: 0');
              }
            }),
      ),
      body: StreamBuilder<List<List<int>>>(
          stream: _controller.counterStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // Render the grid using a GridView
              return GridView.count(
                crossAxisCount: snapshot.data![0].length,
                children: List.generate(
                    snapshot.data!.length * snapshot.data![0].length, (index) {
                  int row = index ~/ snapshot.data![0].length;
                  int column = index % snapshot.data![0].length;
                  return Container(
                    decoration: BoxDecoration(
                      color: snapshot.data![row][column] == 1
                          ? Colors.black
                          : Colors.white,
                      border: Border.all(color: Colors.grey),
                    ),
                  );
                }),
              );
            } else {
              return const Center(
                child: Text("Not Started Yet!"),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        // Toggle play/pause state
        onPressed: () {
          !_controller.isRunning
              ? _controller.eventSink.add(GridStatePlay("random"))
              : _controller.eventSink.add(GridStatePaused("random"));
        },
        child: StreamBuilder<GridState>(
            stream: _controller.eventStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Icon(snapshot.data is GridStatePlay
                    ? Icons.pause
                    : Icons.play_arrow);
              } else {
                return const Icon(Icons.play_arrow);
              }
            }),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up controller resources
    _controller.onDestroy();
    super.dispose();
  }
}
