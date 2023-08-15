import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/cubit/barrel_theme.dart';
import 'src/bloc/bloc_observer/global_observer.dart';

import 'src/routes/routes_pages.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! jadi ketika kita sudah menggunakan BlocProvider
    //! maka tidak perlu lagi menggunakan instansiasi seperti :
    //! "final ThemeCubit _themeCubit = ThemeCubit();"
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        // context harus diisi jika ada widget yg membutuhkan
        builder: (_, theme) {
          return MaterialApp(
            theme: theme,
            // home: const HomePage(),
            initialRoute: AppRoutes.initialRoute,
            routes: AppRoutes.routes,
            onGenerateRoute: (routeSettings) {
              //check log routeSettings value
              log(routeSettings.toString());
              //get routes with transition
              return AppRoutes.routesWithTransition(routeSettings);
            },
          );
        },
      ),
    );
  }
}
