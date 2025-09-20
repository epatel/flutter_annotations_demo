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
3. Provides a two-step initialization process for handling dependencies

### Two-Step Initialization Process

The initialization happens in two phases:

1. **First Step**: All `initialize()` methods are called and can return a callback function or null
2. **Second Step**: All returned callbacks are executed, allowing services to look up dependencies that were registered in the first step

### Example Usage

```dart
// Mark classes that need initialization
@Initializer()
class DatabaseService {
  static Function()? initialize() {
    print('Step 1: Initializing DatabaseService...');
    // Register database service
    ServiceLocator.register<DatabaseService>(DatabaseService._internal());

    // Return callback for second step
    return () {
      print('Step 2: DatabaseService post-initialization');
      // Any setup that depends on other services being registered
    };
  }

  DatabaseService._internal();
}

@Initializer()
class ApiService {
  static Function()? initialize() {
    print('Step 1: Initializing ApiService...');
    // Register API service
    ServiceLocator.register<ApiService>(ApiService._internal());

    // Return callback to configure API with database
    return () {
      print('Step 2: Configuring ApiService with database');
      final db = ServiceLocator.get<DatabaseService>();
      // Configure API service with database dependency
    };
  }

  ApiService._internal();
}

@Initializer()
class LoggingService {
  static Function()? initialize() {
    print('Step 1: Initializing LoggingService...');
    // Register logging service
    ServiceLocator.register<LoggingService>(LoggingService._internal());

    // No second step needed, return null
    return null;
  }

  LoggingService._internal();
}
```

After running `make generate`, you can initialize all services at once:

```dart
import 'builder.g.dart';

void main() {
  // Two-step initialization of all services marked with @Initializer()
  builderInitializer();

  runApp(MyApp());
}
```

The generated `builderInitializer()` function will:
1. Call all `initialize()` methods and collect returned callbacks
2. Execute all collected callbacks in the second step

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
     static Function()? initialize() {
       // Step 1: Register or setup the service
       print('Registering MyService...');

       // Return a callback for step 2, or null if no second step needed
       return () {
         print('MyService second step initialization');
         // Access other services that were registered in step 1
       };
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
     builderInitializer(); // Two-step initialization of all @Initializer() classes
     runApp(MyApp());
   }
   ```

### Method Signature

The `initialize()` method must have this signature:
```dart
static Function()? initialize()
```

- **Return Type**: `Function()?` - either a callback function or null
- **First Step**: The method itself runs first for all classes
- **Second Step**: All returned callbacks are executed after all first steps complete

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

The `@Initializer()` annotation with two-step initialization is perfect for:

- **Service Registration**: Register services in step 1, configure dependencies in step 2
- **Configuration Setup**: Load settings in step 1, apply configurations in step 2
- **Third-party Library Initialization**: Initialize libraries in step 1, configure with dependencies in step 2
- **Dependency Injection**: Register services in step 1, wire dependencies in step 2
- **State Management**: Create providers in step 1, initialize with data in step 2

### Why Two Steps?

The two-step process solves the dependency ordering problem:

1. **Step 1**: All services register themselves (no dependencies needed)
2. **Step 2**: All services can safely look up and use other services that were registered in step 1

This eliminates the need to manually order your initializers or worry about circular dependencies.

## 📄 License

This project is a demonstration of Flutter's `@Initializer()` annotation system and is available for educational purposes.
