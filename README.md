# 🚀 Flutter Annotations Demo

> A modern Flutter app showcasing custom annotation-driven code generation and clean architecture patterns.

## ✨ What's Inside

- **Custom `@Initializer()` annotation** - Auto-register services with dependency resolution
- **Clean Architecture** - Provider + go_router + immutable models
- **Two-step initialization** - Dependency ordering solved elegantly
- **Live code generation** - Build system that generates initialization code

## 🎯 Quick Start

**1. Install the CLI tool**
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/epatel/flutter_annotations/HEAD/install.sh)"
```

**2. Run the project**
```bash
make                # Show available commands
make reset          # Install dependencies
make generate       # Generate annotations
make run            # Launch app
```

## 🏗️ Architecture

```
lib/
├── models/         # Immutable data classes
├── providers/      # State management
├── screens/        # UI components
├── annotations.g.dart  # Generated classes
└── builder.g.dart      # Generated initialization
```

## 💡 Key Features

**Smart Initialization**
```dart
@Initializer()
class ApiService {
  static Function()? initialize() {
    // Step 1: Register service
    register(ApiService());

    // Step 2: Return dependency setup
    return () => configureWithDatabase();
  }
}
```

**Generated Bootstrap**
```dart
void main() {
  builderInitializer(); // Runs all @Initializer() classes
  runApp(MyApp());
}
```

**Modern Flutter Stack**
- `go_router` for navigation
- `provider` for state management
- Immutable models with `copyWith`
- Barrel imports pattern

## 🔧 Development

| Command | Purpose |
|---------|---------|
| `make generate` | Update generated code |
| `make test` | Run tests |
| `make format` | Format code |

The annotation system automatically discovers `@Initializer()` classes and generates a `builderInitializer()` function that handles two-step initialization - perfect for dependency injection and service registration without manual ordering.
