import 'package:flutter/material.dart';
import 'dart:math' as math;

class InheritedState extends InheritedWidget {
  final CounterState counterState;

  InheritedState({
    Key key,
    @required this.counterState,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedState old) => true;

  static InheritedState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedState>();
  }
}

class CounterStateHolder extends StatefulWidget {
  final Widget child;

  CounterStateHolder({this.child});

  @override
  State<StatefulWidget> createState() => CounterState();
}

class CounterState extends State<CounterStateHolder> {
  int _counterValue = 0;

  int get counterValue => _counterValue;

  void increment() => setState(() => _counterValue++);
  void random() => setState(() => _counterValue = math.Random().nextInt(20));
  void decrement() => setState(() => _counterValue--);

  @override
  Widget build(BuildContext context) {
    print('aaaa');
    return InheritedState(
      counterState: this,
      child: widget.child,
    );
  }
}
