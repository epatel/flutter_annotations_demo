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

This Flutter application demonstrates a custom annotation-driven code generation system.

## 🎯 What This App Shows

A registry-based builder that processes annotations and generates extension methods without modifying source files.

### Available Annotations

- **@Initializer** - Auto-register classes for two-step initialization
- **@generateToString** - Generate `toStringGenerated()` method
- **@generateEquality** - Generate `isEqualTo()` and `generatedHashCode`
- **@jsonSerializable** - Generate `toJson()` and `fromJson()` methods
- **@generateCopyWith** - Generate `copyWith()` method

## 🏗️ How It Works

The builder scans Dart files, detects annotations, and generates two files:
- `annotations.g.dart` - Annotation class definitions
- `builder.g.dart` - Extension methods and `builderInitializer()` function

### Two-Step Initialization

1. **Step 1**: All `initialize()` methods run and can return callbacks
2. **Step 2**: All returned callbacks execute, allowing access to dependencies

## 🔧 Example Usage

```dart
@Initializer()
class CounterOption {
  static Function()? initialize() {
    // Register navigation option
    addOption({
      'title': 'Counter',
      'route': '/counter',
      'icon': Icons.calculate,
      'screen': () => const CounterScreen(),
    });

    // Register state provider
    addChangeNotifierProvider<CounterProvider>(
      ChangeNotifierProvider(create: (_) => CounterProvider()),
    );

    return null; // or return callback for step 2
  }
}
```

## 🚀 Development Commands

- `make reset` - Clean and install dependencies
- `make generate` - Generate annotation code
- `make run` - Run the app
- `make test` - Run tests
- `make format` - Format code
- `make analyze` - Analyze code
- `make build` - Build for web

## 📚 Learn More

- Check `README.md` for quick start guide
- Explore `builder/` directory for builder system details
- See `lib/options/` for real examples of `@Initializer()` usage

---

*Built with go_router, provider, and custom code generation.*
''';
