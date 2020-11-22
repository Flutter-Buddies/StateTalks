import 'package:example/bloc/counter_bloc.dart';
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
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
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
    return BlocBuilder<CounterBloc, CounterState>(
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
    // final CounterState state = context.watch<CounterBloc>().state;
    // if (state is HasValue) {
    //   return Text(
    //     state.value.toString(),
    //     style: Theme.of(context).textTheme.headline1,
    //   );
    // }
    // return CircularProgressIndicator();
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
                  BlocProvider.of<CounterBloc>(context).add(Increment()),
              //onPressed: () => context.read<CounterBloc>().add(Increment()),
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () =>
                  BlocProvider.of<CounterBloc>(context).add(GetRandom()),
              //onPressed: () => context.read<CounterBloc>().add(GetRandom()),
              child: Text('?', style: TextStyle(fontSize: 18)),
            ),
            FloatingActionButton(
              onPressed: () =>
                  BlocProvider.of<CounterBloc>(context).add(Decrement()),
              //onPressed: () => context.read<CounterBloc>().add(Decrement()),
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
