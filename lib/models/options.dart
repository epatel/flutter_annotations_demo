import 'package:flutter_annotations_demo/index.dart';

List<Map<String, dynamic>> _options = [];
List<ChangeNotifierProvider> _changeNotifierProviders = [];

List<Map<String, dynamic>> get options => _options;
List<ChangeNotifierProvider> get changeNotifierProviders =>
    _changeNotifierProviders;

void addOption(Map<String, dynamic> option) {
  _options.add(option);
}

void addChangeNotifierProvider<T extends ChangeNotifier>(
  ChangeNotifierProvider<T> changeNotifierProvider,
) {
  _changeNotifierProviders.add(changeNotifierProvider);
}
