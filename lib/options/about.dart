import 'package:flutter_annotations_demo/index.dart';

// ------------------------------------------------------------

@Initializer()
class AboutOption {
  AboutOption();

  static Function()? initialize() {
    addOption({
      'title': 'About',
      'route': '/about',
      'icon': Icons.info,
      'screen': () => const AboutScreen(),
    });

    return null;
  }
}

// ------------------------------------------------------------

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('About'),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Markdown(
          data: _aboutMarkdown,
          selectable: true,
        ),
      ),
    );
  }
}

const String _aboutMarkdown = '''
# Flutter Annotations Demo

This Flutter application demonstrates a custom **@Initializer()** annotation system with dynamic code generation.

## 🎯 What This App Shows

This project showcases how to build and use the `@Initializer()` annotation to automatically register classes for initialization callbacks in a centralized system.

### Key Features

- **Dynamic Code Generation**: Generates initialization code without modifying source files
- **Two-Step Initialization**: Handles dependency ordering automatically
- **Registry-Based Architecture**: Self-registering annotation processor
- **Non-Intrusive**: Original classes remain unchanged

## 🏗️ How It Works

### The @Initializer() Annotation

Classes marked with `@Initializer()` are automatically:

1. **Detected** by the builder system
2. **Added** to the generated `builderInitializer()` function
3. **Initialized** in a two-step process

### Two-Step Process

1. **Step 1**: All `initialize()` methods run and can return callbacks
2. **Step 2**: All returned callbacks execute, allowing services to access dependencies

## 🔧 Example Usage

```dart
@Initializer()
class MyService {
  static Function()? initialize() {
    // Step 1: Register the service
    ServiceLocator.register<MyService>(MyService());

    // Return callback for step 2
    return () {
      // Step 2: Configure with dependencies
      final otherService = ServiceLocator.get<OtherService>();
      // Configure this service with dependencies
    };
  }
}
```

## 🚀 Development Commands

This project includes a comprehensive Makefile:

- `make reset` - Clean and install dependencies
- `make generate` - Generate annotation code
- `make run` - Run the app
- `make test` - Run tests
- `make build` - Build for web

## 📚 Learn More

- Check the project's README.md for detailed documentation
- Explore the `builder/` directory for the annotation system implementation
- See `lib/options/` for examples of `@Initializer()` usage

---

*This demo shows how custom annotations can solve real-world problems like dependency injection and service initialization in Flutter applications.*
''';
