import 'package:example/bloc/counter_cubit.dart';
import 'package:example/data/random_number_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(
          randomNumberRepository: RandomNumberRepository(),
        ),
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
        title: Text('State Talks: flutter_bloc'),
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
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        if (state is HasValue) {
          return Text(
            state.value.toString(),
            style: Theme.of(context).textTheme.headline1,
          );
        }
        return CircularProgressIndicator();
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
              onPressed: () =>
                  BlocProvider.of<CounterCubit>(context).handleIncrement(),
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () =>
                  BlocProvider.of<CounterCubit>(context).handleRandom(20),
              child: Text('?', style: TextStyle(fontSize: 18)),
            ),
            FloatingActionButton(
              onPressed: () =>
                  BlocProvider.of<CounterCubit>(context).handleDecrement(),
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
