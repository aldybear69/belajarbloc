import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/barrel_theme.dart';
import '../../../models/test_arguments.dart';
import '../../../routes/routes_pages.dart';
import '../../../utils/barrel_custom_navigator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePageView();
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Belajar BLoC')),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                Nav.pushNamed(RouteName.counter, context);
              },
              child: const Text("Counter App")),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                Nav.pushNamed(RouteName.counterTanpaBlockProvider, context);
              },
              child: const Text("Counter App (tanpa BlocProvider)")),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                Nav.pushNamed(RouteName.firstPage, context,
                    arguments: const Args("Jakarta", "Indonesia"));
              },
              child: const Text("Test Route"))
        ])),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.brightness_6),
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme();
          },
        ));
  }
}
