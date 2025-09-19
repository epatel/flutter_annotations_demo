# Flutter Annotations Demo

A Flutter project demonstrating a custom annotation system with dynamic code generation. This project showcases how to build and use custom annotations that generate extension methods for common patterns like `toString()`, `copyWith()`, `toJson()`, equality checks, and more.

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

### Custom Annotation System
- **Dynamic Code Generation**: Generates extension methods without modifying source files
- **Registry-Based Architecture**: Self-registering annotation processors
- **Parameter Support**: Configurable annotations with type-safe parameters
- **Non-Intrusive**: Original classes remain unchanged

### Available Annotations

| Annotation | Generated Methods | Description |
|------------|------------------|-------------|
| `@generateToString` | `toStringGenerated()` | Custom toString implementation |
| `@generateEquality` | `isEqualTo()`, `generatedHashCode` | Equality and hash code |
| `@jsonSerializable` | `toJson()`, `fromJson()` | JSON serialization |
| `@generateCopyWith` | `copyWith()` | Immutable object copying |
| `@initializer` | Added to `builderInitializer()` | Initialization callbacks |

### Example Usage

```dart
@generateToString
@generateEquality
@jsonSerializable
@generateCopyWith
class User {
  final String name;
  final int age;
  final String email;

  User({required this.name, required this.age, required this.email});
}

// After running 'make generate', you can use:
final user = User(name: 'John', age: 30, email: 'john@example.com');

// Generated methods
print(user.toStringGenerated());
final userCopy = user.copyWith(age: 31);
final json = user.toJson();
final isEqual = user.isEqualTo(userCopy);
```

## 🔧 Development Workflow

1. **Modify Models**: Add or update annotations on your model classes
2. **Generate Code**: Run `make generate` to update generated files
3. **Use Extensions**: Generated methods are automatically available
4. **Test**: Run `make test` to verify functionality
5. **Format**: Code is automatically formatted during generation

## 📚 Documentation

- **Builder System**: See [builder/README.md](builder/README.md) for detailed documentation on the annotation system
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

## 📄 License

This project is a demonstration of Flutter annotation systems and is available for educational purposes.
