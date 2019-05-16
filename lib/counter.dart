import 'package:rxdart/rxdart.dart';

class Counter {
  BehaviorSubject _counter = BehaviorSubject.seeded(1);

  Observable get stream$ => _counter.stream;

  int get current => _counter.value;

  increment() {
    _counter.add(current + 1);
    if (_counter.value == 4) {}
  }
}
Counter counterService = Counter();

