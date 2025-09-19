class Counter {
  final int value;
  final DateTime? lastUpdated;

  const Counter({required this.value, this.lastUpdated});

  const Counter.initial() : value = 0, lastUpdated = null;

  Counter copyWith({int? value, DateTime? lastUpdated}) {
    return Counter(
      value: value ?? this.value,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  Counter increment() {
    return copyWith(value: value + 1, lastUpdated: DateTime.now());
  }

  Counter reset() {
    return copyWith(value: 0, lastUpdated: DateTime.now());
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Counter &&
        other.value == value &&
        other.lastUpdated == lastUpdated;
  }

  @override
  int get hashCode => value.hashCode ^ lastUpdated.hashCode;

  @override
  String toString() => 'Counter(value: $value, lastUpdated: $lastUpdated)';
}
