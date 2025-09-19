# Flutter Annotations Demo

A Flutter project demonstrating a custom `@Initializer()` annotation system with dynamic code generation. This project showcases how to build and use the `@Initializer()` annotation to automatically register classes for initialization callbacks in a centralized system.

## 🚀 Quick Start

### Using Make Commands (Recommended)

This project includes a comprehensive Makefile with an interactive menu system:

```bash
# Show available commands
make

# Interactive command selection
make select

# Or run commands directly
make reset    # Clean and install dependencies
make generate # Generate annotation code
make run      # Run the app
make test     # Run tests
make build    # Build for web
```

### Manual Commands

```bash
# Install dependencies
flutter pub get

# Generate annotations and extensions
dart run builder/builder.dart lib

# Run the app
flutter run -d chrome

# Run tests
flutter test
```

## 📋 Available Make Commands

| Command | Description |
|---------|-------------|
| `make reset` | Clean project and reinstall dependencies |
| `make format` | Format code in lib/, test/, and builder/ |
| `make test` | Run all Flutter tests |
| `make analyze` | Run Flutter analyzer |
| `make build` | Clean build for web |
| `make run` | Run app in debug mode on Chrome |
| `make generate` | Generate annotations and format code |
| `make update_phony` | Update Makefile .PHONY targets |

## 🏗️ Project Structure

```
flutter_annotations_demo/
├── lib/                   # Main Flutter application
│   ├── models/            # Data models with annotations
│   ├── screens/           # UI screens
│   ├── providers/         # State management
│   ├── annotations.g.dart # Generated annotation classes
│   └── builder.g.dart     # Generated extensions
├── builder/               # Custom annotation system
│   ├── annotations/       # Annotation processors
│   ├── core/              # Code generation engine
│   └── builder.dart       # Main builder entry point
├── test/                  # Tests
└── Makefile               # Development commands
```

## 🎯 Features

### Initializer Annotation System
- **Automatic Registration**: Classes marked with `@Initializer()` are automatically registered
- **Centralized Initialization**: All initializers are collected into a single `builderInitializer()` function
- **Dynamic Code Generation**: Generates initialization code without modifying source files
- **Registry-Based Architecture**: Self-registering annotation processor
- **Non-Intrusive**: Original classes remain unchanged

### The `@Initializer()` Annotation

The `@Initializer()` annotation is used to mark classes that need to be initialized at application startup. When you annotate a class with `@Initializer()`, the builder system automatically:

1. Detects the annotated class
2. Adds it to the generated `builderInitializer()` function
3. Provides a centralized way to initialize all marked classes

### Example Usage

```dart
// Mark classes that need initialization
@Initializer()
class DatabaseService {
  static void initialize() {
    print('Initializing DatabaseService...');
    // Database setup code here
  }
}

@Initializer()
class ApiService {
  static void initialize() {
    print('Initializing ApiService...');
    // API configuration code here
  }
}

@Initializer()
class LoggingService {
  static void initialize() {
    print('Initializing LoggingService...');
    // Logging setup code here
  }
}
```

After running `make generate`, you can initialize all services at once:

```dart
import 'builder.g.dart';

void main() {
  // Initialize all services marked with @Initializer()
  builderInitializer();

  runApp(MyApp());
}
```

The generated `builderInitializer()` function will call the `initialize()` method on all classes marked with `@Initializer()`.

## 🔧 Development Workflow

1. **Add Initializer Annotations**: Mark classes that need initialization with `@Initializer()`
2. **Generate Code**: Run `make generate` to update the `builderInitializer()` function
3. **Call Initializer**: Use `builderInitializer()` in your app's main function
4. **Test**: Run `make test` to verify functionality
5. **Format**: Code is automatically formatted during generation

### Working with Initializers

1. **Create a Service Class**:
   ```dart
   @Initializer()
   class MyService {
     static void initialize() {
       // Your initialization code
     }
   }
   ```

2. **Generate the Code**:
   ```bash
   make generate
   ```

3. **Use in Your App**:
   ```dart
   import 'builder.g.dart';

   void main() {
     builderInitializer(); // Calls all @Initializer() classes
     runApp(MyApp());
   }
   ```

## 📚 Documentation

- **Builder System**: See [builder/README.md](builder/README.md) for detailed documentation on the annotation system and how to extend it
- **Initializer Pattern**: The `@Initializer()` annotation provides a clean way to manage application startup dependencies
- **Flutter Docs**: [Flutter Documentation](https://docs.flutter.dev/)
- **Dart Analyzer**: [analyzer package](https://pub.dev/packages/analyzer)

## 🧪 Testing

```bash
# Run all tests
make test

# Run specific test files
flutter test test/widget_test.dart
```

## 🌐 Building for Web

```bash
# Clean build for web
make build

# Or manually
flutter build web
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Add your changes and tests
4. Run `make format` and `make test`
5. Submit a pull request

## 🎯 Use Cases

The `@Initializer()` annotation is perfect for:

- **Service Registration**: Database connections, API clients, logging services
- **Configuration Setup**: Loading app settings, environment variables
- **Third-party Library Initialization**: Firebase, analytics, crash reporting
- **Dependency Injection**: Setting up service locators or DI containers
- **State Management**: Initializing global state providers

## 📄 License

This project is a demonstration of Flutter's `@Initializer()` annotation system and is available for educational purposes.
