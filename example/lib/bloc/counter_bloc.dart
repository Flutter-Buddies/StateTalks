import 'dart:async';
import 'dart:math' as math;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int _value;

  CounterBloc()
      : _value = 0,
        super(HasValue(0));

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is Increment) {
      this._handleIncrement();
      yield HasValue(_value);
    } else if (event is Decrement) {
      this._handleDecrement();
      yield HasValue(_value);
    } else if (event is GetRandom) {
      yield WaitingValue();
      await this._handleRandom(event.max);
      yield HasValue(_value);
    }
  }

  _handleIncrement() {
    this._value++;
  }

  _handleDecrement() {
    this._value--;
  }

  Future<void> _handleRandom(int max) async {
    await Future.delayed(Duration(seconds: 1));
    this._value = math.Random().nextInt(max);
  }
}
