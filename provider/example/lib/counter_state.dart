import 'package:flutter/material.dart';

class CounterState extends InheritedWidget {
  final int counterValue;

  CounterState({
    Key key,
    @required this.counterValue,
    @required Widget child,
  }) : super(key: key, child: child);

  static CounterState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterState>();
  }

  @override
  bool updateShouldNotify(CounterState old) => counterValue != old.counterValue;
}
