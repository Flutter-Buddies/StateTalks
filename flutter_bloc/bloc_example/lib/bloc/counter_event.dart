part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class GetRandom extends CounterEvent with EquatableMixin {
  final int max;

  GetRandom({
    this.max: 20,
  });

  @override
  List<Object> get props => [max];
}
