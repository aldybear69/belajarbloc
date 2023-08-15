import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'c_event.dart';
part 'c_state.dart';

class CBloc extends Bloc<CEvent, CState> {
  CBloc() : super(const CInitial(10)) {
    // ! Cara 1 Pake if else dipisah
    // on<CEvent>((event, emit) {
    //   if (event is CounterIncrementEvent) {
    //     emit(CInitial(state.number + event.number));
    //   } else {
    //     emit(CInitial(state.number - 1));
    //   }
    // });

    // ! Cara 2 Pake nama event nya langsung masing2
    on<CounterIncrementEvent>(
        (event, emit) => emit(CInitial(state.number + 1)));
    on<CounterDecrementEvent>(
        (event, emit) => emit(CInitial(state.number - 1)));
  }
}
