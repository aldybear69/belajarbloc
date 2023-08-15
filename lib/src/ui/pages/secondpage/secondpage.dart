import 'package:flutter/material.dart';

import '../../../utils/barrel_custom_navigator.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false, title: const Text("Second Page")),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("Second Page!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Nav.pop(context);
                    },
                    child: const Text("Back"))
              ],
            )
          ]),
        ));
  }
}
