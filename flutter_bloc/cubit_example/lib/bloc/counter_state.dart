part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class HasValue extends CounterState with EquatableMixin {
  final int value;

  HasValue(this.value);

  @override
  List<Object> get props => [value];
}

class WaitingValue extends CounterState {}
