# MockApi Flutter Project

This is a Flutter application that demonstrates a simple CRUD operation using the **MockAPI** service and implements **clean architecture** with **GetX** for state management and dependency injection.

## Features

- **CRUD Operations** on tasks using REST API from MockAPI.
- Follows **Clean Architecture** for separation of concerns.
- **State management** and **dependency injection** using **GetX**.
- **Dio** for handling HTTP requests.
- **Mocking** and unit testing with **Mockito**.
- **Custom widgets** for task display and handling.

## API Information

The project uses [MockAPI](https://mockapi.io/projects/6717d327b910c6a6e02a27ed) for simulating RESTful API operations. Below are the available endpoints:

| Method | Endpoint           | Description                |
|--------|--------------------|----------------------------|
| GET    | `/task`             | Fetch all tasks            |
| GET    | `/task/:id`         | Fetch task by ID           |
| POST   | `/task`             | Create a new task          |
| PUT    | `/task/:id`         | Update a task by ID        |
| DELETE | `/task/:id`         | Delete a task by ID        |

Base URL: `https://6717d327b910c6a6e02a27ed.mockapi.io/api/v1`

## Project Structure

This project follows the **clean architecture** pattern to ensure separation of concerns and better maintainability:

```sh
lib/
├── app/
│   ├── const/                # Application constants and utilities
│   ├── app_binding.dart      # Binding classes for dependencies
│   ├── app_pages.dart        # Route definitions
│   ├── app.dart              # Main app widget
│   ├── utils.dart            # Helper methods (e.g., formatting)
├── data/
│   ├── entity/               # Data models and entities
│   ├── repository/           # Repository pattern for data access
│   └── usecase/              # Business logic (use cases)
├── domain/
│   ├── entity/               # Core domain models (TaskEntity, etc.)
│   ├── repository/           # Repository interfaces
│   ├── usecase/              # Use cases for CRUD operations
├── presentation/
│   ├── detail/               # Detail page logic and UI
│   ├── home/                 # Home page logic and UI
│   ├── splash/               # Splash screen logic and UI
│   └── widget/               # Shared widgets (task item, dialogs, etc.)
├── main.dart                 # Application entry point
```


### Requirements

Flutter (Channel stable, 3.19.6). Installation guide: https://flutter.dev/docs/get-started/install/

Check your installation status using `flutter doctor` command.

```bash  
$ flutter doctor  
Doctor summary (to see all details, run flutter doctor -v):  
[✓] Flutter (Channel stable, 3.19.6, on macOS 14.2.1 23C71 darwin-arm64, locale
    en-ID)
[✓] Android toolchain - develop for Android devices (Android SDK version 32.0.0)  
[✓] Xcode - develop for iOS and macOS (Xcode 13.4)  
[✓] Android Studio (version 2020.3)  
[✓] VS Code (version 1.68.0)    
```  

### Install Dependency

```bash
flutter pub get
```

### Run DEBUG Mode

```bash
flutter run
```

### Run PROFILE Mode

```bash
flutter run --profile
```

### Run RELEASE Mode

```bash
flutter run --release 
```

### Build APK

```bash
flutter build apk --release 
