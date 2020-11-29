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
          Text(
            '$_counterValue',
            style: Theme.of(context).textTheme.headline1,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(48.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () => setState(() => _counterValue++),
                    child: Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () => setState(
                        () => _counterValue = math.Random().nextInt(20)),
                    child: Text('?', style: TextStyle(fontSize: 18)),
                  ),
                  FloatingActionButton(
                    onPressed: () => setState(() => _counterValue--),
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class CounterValue extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       '0',
//       style: Theme.of(context).textTheme.headline1,
//     );
//   }
// }

// class ControlButtons extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Padding(
//         padding: const EdgeInsets.all(48.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             FloatingActionButton(
//               onPressed: () {},
//               child: Icon(Icons.add),
//             ),
//             FloatingActionButton(
//               onPressed: () {},
//               child: Text('?', style: TextStyle(fontSize: 18)),
//             ),
//             FloatingActionButton(
//               onPressed: () {},
//               child: Icon(Icons.remove),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
