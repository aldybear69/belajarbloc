import 'package:belajarbloc/src/routes/routes_pages.dart';
import 'package:flutter/material.dart';

import '../../../models/test_arguments.dart';
import '../../../utils/barrel_custom_navigator.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // get the argument data dari data pass melalui route cast as Map (cast as Modal class)
    final args = ModalRoute.of(context)?.settings.arguments as Args;

    return Scaffold(
        appBar: AppBar(title: const Text("First Page")),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    textAlign: TextAlign.center,
                    "First Page!\n===========\nCity: ${args.city},\nCountry: ${args.country}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30)),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Nav.pop(context);
                        },
                        child: const Text("Back Home")),
                    ElevatedButton(
                        onPressed: () {
                          // Nav.push(context, const SecondPage());
                          Nav.pushNamed(RouteName.secondPage, context);
                        },
                        child: const Text("Goto Second Page"))
                  ],
                )
              ]),
        ));
  }
}
