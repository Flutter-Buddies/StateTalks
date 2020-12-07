import 'package:flutter/material.dart';

class _MyInheritedWidget<T extends ChangeNotifier> extends InheritedWidget {
  _MyInheritedWidget({Key key, Widget child, _MyProviderState state})
      : state = state,
        super(key: key, child: child);

  final _MyProviderState state;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static _MyInheritedWidget of<T extends ChangeNotifier>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_MyInheritedWidget<T>>();
  }
}

class MyProvider<T extends ChangeNotifier> extends StatefulWidget {
  final T data;
  final Widget child;

  MyProvider({this.data, this.child});

  @override
  State<StatefulWidget> createState() => _MyProviderState<T>();

  static _MyProviderState<T> of<T extends ChangeNotifier>(
      BuildContext context) {
    return _MyInheritedWidget.of<T>(context).state;
  }
}

class _MyProviderState<T extends ChangeNotifier> extends State<MyProvider<T>> {
  T data;

  @override
  void initState() {
    data = widget.data;
    data.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _MyInheritedWidget<T>(
      state: this,
      child: widget.child,
    );
  }
}

extension ExtractData on BuildContext {
  T extract<T extends ChangeNotifier>() => MyProvider.of<T>(this).data;
}
