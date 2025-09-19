import 'package:flutter_annotations_demo/index.dart';

void main() {
  builderInitializer();
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const App(),
    ),
  );
}
