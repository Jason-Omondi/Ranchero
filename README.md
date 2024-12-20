# Employee Self Service App

## Proposed Architecture
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
|       ├── name_of_screen/ (folders)
|           ├── bindings/ (Bindings for each GetX controller)
|           ├── controllers/ (State controller for each screen)
|           ├── screen.dart (Screen-specific widgets)
├── main.dart (App entry point)
```

## Screenshots

<div align="center">
  <table>
    <tr>
      <td align="center" style="padding:10px;">
        <img src="https://github.com/Jason-Omondi/python-journey/blob/main/splash.PNG" width="200" alt="Onboarding Screen"/>
        <br/>
        <small>Onboarding Screen</small>
      </td>
      <td align="center" style="padding:10px;">
        <img src="https://github.com/Jason-Omondi/python-journey/blob/main/login.PNG" width="200" alt="Login Screen"/>
        <br/>
        <small>Login Screen</small>
      </td>
      <td align="center" style="padding:10px;">
        <img src="https://github.com/Jason-Omondi/python-journey/blob/main/dashboard.PNG" width="200" alt="Dashboard Screen"/>
        <br/>
        <small>Dashboard Screen</small>
      </td>
    </tr>
  </table>
</div>


