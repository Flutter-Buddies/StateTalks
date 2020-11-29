import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _counterValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Talks: provider'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CounterValue(value: _counterValue),
          ControlButtons(
            onIncrementPressed: () => setState(() => _counterValue++),
            onRandomPressed: () =>
                setState(() => _counterValue = math.Random().nextInt(20)),
            onDecrementPressed: () => setState(() => _counterValue--),
          ),
        ],
      ),
    );
  }
}

class CounterValue extends StatelessWidget {
  final int value;

  CounterValue({this.value});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${this.value}',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

class ControlButtons extends StatelessWidget {
  final void Function() onIncrementPressed;
  final void Function() onRandomPressed;
  final void Function() onDecrementPressed;

  ControlButtons({
    this.onIncrementPressed,
    this.onRandomPressed,
    this.onDecrementPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: onIncrementPressed,
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: onRandomPressed,
              child: Text('?', style: TextStyle(fontSize: 18)),
            ),
            FloatingActionButton(
              onPressed: onDecrementPressed,
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
