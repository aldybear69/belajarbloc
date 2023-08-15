part of 'c_bloc.dart';

@immutable
abstract class CState {
  final int number;
  const CState(this.number);
}

class CInitial extends CState {
  const CInitial(int i) : super(i);
}
