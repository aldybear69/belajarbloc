part of 'c_bloc.dart';

@immutable
abstract class CEvent {}

/// Notifies bloc to increment state.
class CounterIncrementEvent extends CEvent {
  final int number;

  CounterIncrementEvent({this.number = 1});
}

/// Notifies bloc to decrement state.
class CounterDecrementEvent extends CEvent {}
