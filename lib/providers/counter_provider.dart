import 'package:flutter_annotations_demo/index.dart';

class CounterProvider extends ChangeNotifier {
  Counter _counter = const Counter.initial();

  Counter get counter => _counter;

  void incrementCounter() {
    _counter = _counter.increment();
    notifyListeners();
  }

  void resetCounter() {
    _counter = _counter.reset();
    notifyListeners();
  }
}
