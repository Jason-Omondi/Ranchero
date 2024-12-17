# Employee Self Service App

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Proposed Architecture
* Layers:

- Presentation Layer: Contains UI, controllers, and widgets.
- Domain Layer: Contains business logic, use cases, and models.

* Data Layer: Manages API calls, data sources, and repository implementations.

* State Management:
- Use GetX for controllers and state management.

## Folder Structure:
```
lib/
├── core/
│   ├── constants/ (App-wide constants like app_theme, etc.)
│   ├── utils/ (Helpers and utilities eg extensions.dart)
│   ├── widgets/ (Reusable widgets)
├── data/
│   ├── models/ (Data models for API responses)
│   ├── repositories/ (Repository implementations)
│   ├── providers/ (API interactions using Dio or HTTP)
├── domain/
│   ├── entities/ (Core entities used in domain layer)
│   ├── usecases/ (Business logic for API requests)
├── presentation/
│   ├── screens/ (UI screens)
|       ├── login_screen/
|           ├── bindings/ (Bindings for each GetX controller)
|           ├── controllers/ (State controller for each screen)
|           ├── loginscreen.dart (Screen-specific widgets)
|       ├── splash_screen/
|           ├── bindings/ (Bindings for GetX controller)
|           ├── controllers/ (State controller for screen)
|           ├── loginscreen.dart (Screen-specific widgets)
├── main.dart (App entry point)
```
