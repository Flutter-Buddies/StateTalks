import 'package:example/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => CounterState(),
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
    return Consumer<CounterState>(
      builder: (context, counterState, child) {
        return Text(
          '${counterState.counterValue}',
          style: Theme.of(context).textTheme.headline1,
        );
      },
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
              onPressed: () => context.read<CounterState>().increment(),
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () => context.read<CounterState>().random(),
              child: Text('?', style: TextStyle(fontSize: 18)),
            ),
            FloatingActionButton(
              onPressed: () => context.read<CounterState>().decrement(),
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
