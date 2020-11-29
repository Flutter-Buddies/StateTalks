import 'package:example/counter_state.dart';
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
      home: CounterState(
        counterValue: 0,
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Talks: provider'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CounterValue(),
          ControlButtons(),
        ],
      ),
    );
  }
}

class CounterValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      CounterState.of(context).counterValue.toString(),
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

class ControlButtons extends StatelessWidget {
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
              onPressed: () => CounterState.of(context).counterValue++,
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () => CounterState.of(context).counterValue =
                  math.Random().nextInt(20),
              child: Text('?', style: TextStyle(fontSize: 18)),
            ),
            FloatingActionButton(
              onPressed: () => CounterState.of(context).counterValue--,
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
