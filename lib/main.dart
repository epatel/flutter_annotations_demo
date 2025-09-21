import 'package:flutter_annotations_demo/index.dart';

void main() {
  builderInitializer();
  runApp(
    MultiProvider(
      providers: changeNotifierProviders,
      child: const App(),
    ),
  );
}
