import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/theme_data.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(lightTheme);
  // ! gunakan constructor di bawah ini jika initial data di set saat pemanggilan class nya
  // ThemeCubit({required this.initialTheme}) : super(initialTheme);
  // ThemeData initialTheme;

//! jadi ketika kita sudah menggunakan BlocProvider
//! maka tidak perlu lagi menggunakan instansiasi seperti :
//! "final ThemeCubit _themeCubit = ThemeCubit();"

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? lightTheme : darkTheme);
  }

  // Local Observer (onChange and onError)
  @override
  void onChange(Change<ThemeData> change) {
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}
