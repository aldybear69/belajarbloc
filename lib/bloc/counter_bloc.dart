import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((event, emit) => emit(state - 1));
  }
  // ! gunakan constructor di bawah ini jika initial data di set saat pemanggilan class nya
  // int initialInt;
  // CounterBloc({this.initialInt = 0}) : super(initialInt) {
  //   on<CounterIncrementPressed>((event, emit) => emit(state + 1));
  //   on<CounterDecrementPressed>((event, emit) => emit(state - 1));
  // }
}
