import 'package:flutter/material.dart';

class CounterInheritedWidget extends InheritedWidget {
  final int counter;

  const CounterInheritedWidget({
    super.key,
    required this.counter,
    required super.child,
  });

  @override
  bool updateShouldNotify(CounterInheritedWidget oldWidget) {
    return oldWidget.counter != counter;
  }

  static CounterInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterInheritedWidget>();
  }
}
