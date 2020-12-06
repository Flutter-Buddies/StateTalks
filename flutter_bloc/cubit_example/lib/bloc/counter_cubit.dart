import 'dart:async';
import 'dart:math' as math;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example/data/random_number_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int _value;
  RandomNumberRepository randomNumberRepository;

  CounterCubit({@required this.randomNumberRepository})
      : _value = 0,
        super(HasValue(0));

  handleIncrement() {
    this._value++;
    emit(HasValue(_value));
  }

  handleDecrement() {
    this._value--;
    emit(HasValue(_value));
  }

  Future<void> handleRandom(int max) async {
    emit(WaitingValue());
    await Future.delayed(Duration(seconds: 1));
    this._value = await randomNumberRepository.fetchNewRandom();
    emit(HasValue(_value));
  }
}
