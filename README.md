# Trading App - Flutter Clean Architecture Demo

A premium-designed trading application built with Flutter, showcasing real-time data flow, clean architecture principles, and responsive UI design.

## 🚀 Architecture Decisions

This project follows **Clean Architecture** principles to ensure a scalable, maintainable, and testable codebase. The project is divided into three main layers:

### 1. Data Layer
- **Models**: Extends domain entities and includes JSON serialization logic.
- **Data Sources**: Responsible for fetching raw data. In this demo, `MarketDataSource` simulates a live feed using a `StreamController`.
- **Repositories (Implementation)**: Implements the abstract repository interfaces from the domain layer, coordinating data from various sources.

### 2. Domain Layer (Pure Dart)
- **Entities**: Core business objects (e.g., `Stock`). These are independent of any framework.
- **Repositories (Abstract)**: Defines the contract for data operations, ensuring the domain layer remains decoupled from data implementation details.
- **Use Cases**: Encapsulates specific business rules (e.g., `GetNseFutureUsecase`). This is the bridge between the presentation and data layers.

### 3. Presentation Layer
- **BLoCs**: Manages state using the **BLoC (Business Logic Component)** pattern. It converts UI events into states.
- **Pages/Widgets**: Pure UI components built with `flutter_screenutil` for responsiveness.

---

## 🔁 State Management Flow

We use **BLoC** for predictable state management. The flow of data is strictly unidirectional:

1.  **UI Event**: User performs an action (e.g., `LoadNseFuture`).
2.  **BLoC Action**: The BLoC catches the event and calls the relevant **Use Case**.
3.  **Use Case Execution**: The Use Case requests data from the **Repository**.
4.  **Data Flow**: The Repository fetches data from the **Data Source** and returns it as a `Stream`.
5.  **State Update**: The BLoC listens to the stream and emits a new state (e.g., `NseFutureLoaded`).
6.  **UI Rebuild**: The UI (via `BlocBuilder`) reacts to the state change and updates the interface.

---

## 📈 Dummy Trading Logic

To provide a realistic trading experience without a live backend, the project implements a **simulated real-time market**:

- **`MarketDataSource`**: Uses a `Timer.periodic` to trigger updates every 3 seconds.
- **Price Fluctuation**: For each stock, we calculate a random percentage change between -0.5% and +0.5%.
- **Stream-Based Updates**: The updated list of `StockModel` objects is pushed through a broadcast `StreamController`.
- **Consistency**: All price calculations (Buy/Sell/LTR) are derived from the same simulated tick to ensure data integrity across the UI.

---

## 🛠️ Key Technologies
- **Flutter & Dart**
- **BLoC Pattern** (`flutter_bloc`)
- **Dependency Injection** (`get_it`)
- **Responsive Design** (`flutter_screenutil`)
- **SVG Support** (`flutter_svg`)
- **Navigation** (`go_router`)
