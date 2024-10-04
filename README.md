
# Flutter Cubit & BLoC Workshop

This repository is part of a workshop designed to teach the fundamentals of state management using **Cubit** and **BLoC** in Flutter. It covers concepts ranging from simple usage to more advanced techniques for handling state in your Flutter applications.

## Overview

The project is organized into different levels of complexity, with a focus on understanding and implementing Cubit and BLoC patterns. You will find separate folders containing example implementations for basic, simple, standard, and advanced use cases.

### Folder Structure

- **lib/bloc**
  - **advanced/**: Contains more complex examples of BLoC usage with events and states.
    - `advanced_bloc.dart`: BLoC implementation.
    - `advanced_event.dart`: Definition of events.
    - `advanced_state.dart`: Definition of states.
  - **basic/**: Basic counter example using Cubit.
    - `basic_counter_cubit.dart`: Simple Cubit implementation.
  - **simple/**: Another simple Cubit counter implementation.
    - `simple_counter_cubit.dart`
  - **standard/**: Standard implementation of Cubit with separate states.
    - `standard_counter_cubit.dart`
    - `standard_counter_state.dart`
- **lib/pages**: Contains the different UI screens that demonstrate the BLoC and Cubit logic.
  - `ant_screen.dart`: Uses **basic cubit** to demonstrate a simple counter.
  - `bee_screen.dart`: Uses **simple cubit** for counter management.
  - `cat_screen.dart`: Uses **standard cubit** with separate states for a more structured approach.
  - `dolphin_screen.dart`: Uses **advanced BLoC** with events and states for more complex interactions.
  - `home_screen.dart`: Main screen for navigating between examples.
  - `page_not_found_screen.dart`: Custom 404 page.
- **lib/widgets**: Custom reusable widgets used across the project.
  - `custom_floating_action_button.dart`, `custom_scaffold.dart`, `custom_text.dart`
- **lib/utils**: Utility classes or functions.

## Topics Covered

1. **Cubit Basics**
2. **BLoC Architecture**
3. **State Management using Cubit and BLoC**
4. **Advanced BLoC with Events and States**
5. **Navigation & Error Handling**

## Getting Started

To get started with this repository, ensure you have Flutter installed and set up:

1. Clone the repository:
   ```bash
   git clone https://github.com/panmegatech/flutter_cubit_bloc.git
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Screenshots

Include screenshots of the different pages (e.g., ant_screen, bee_screen, etc.) once the project is running, for easier navigation and understanding.

## Contribution

Feel free to contribute by opening issues or submitting pull requests. Any feedback is appreciated!
