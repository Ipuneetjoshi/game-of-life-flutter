# Game of Life Flutter App

A Flutter implementation of Conway's Game of Life, demonstrating modular architecture, reactive UI, and clean code practices.

## Features
- Interactive simulation of Conway's Game of Life
- Dynamic grid display with real-time updates
- Play, pause, and restart controls
- Generation counter
- Modular and extensible codebase

## Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Dart (comes with Flutter)

### Installation
1. Clone this repository:
   ```bash
   git clone <your-repo-url>
   cd game_of_life_starter_code
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Usage
- The app displays a grid representing the Game of Life.
- Use the floating action button to play or pause the simulation.
- The AppBar shows the current generation.

## Code Structure
- `lib/main.dart`: Entry point and UI for the app.
- `lib/controller/controller.dart`: Manages game state, streams, and timer.
- `lib/game_engine/game_engine.dart`: Implements the Game of Life logic.
- `lib/grid_manager/grid_factory.dart`: Creates different types of initial grids.
- `lib/grid_manager/grid_manager.dart`: Manages the grid and its state.
- `lib/grid_manager/grid_state.dart`: Defines grid state classes for state management.

## Customization
- You can add new grid patterns by extending `GridFactory`.
- Adjust grid size or simulation speed in the respective classes.

## License
This project is for educational purposes.
