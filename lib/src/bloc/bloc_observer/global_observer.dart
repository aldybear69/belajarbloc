import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Custom [BlocObserver] that observes all bloc and cubit state changes.
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) {
      debugPrint("PAKE CUBIT");
      log('${bloc.runtimeType} $change');
    } else {
      debugPrint("PAKE BLOC");
      log('${bloc.runtimeType} $change');
    }
  }

  @override
  // ignore: unnecessary_overrides
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // log('${bloc.runtimeType} $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint('${bloc.runtimeType} $error $stackTrace');
  }
}
