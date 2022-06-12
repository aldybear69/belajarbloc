import 'package:belajarbloc/screen/cara_satu_bloc_from_docs.dart';
import 'package:belajarbloc/screen/cara_dua_bloc_from_vscode_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const BlocCaraSatu()),
    // () => runApp(const BlocCaraDua()),
    blocObserver: AppBlocObserver(),
  );
}

/// Custom [BlocObserver] that observes all bloc and cubit state changes.
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) {
      debugPrint("PAKE CUBIT");
    } else {
      debugPrint("PAKE BLOC");
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint(transition.toString());
  }
}
