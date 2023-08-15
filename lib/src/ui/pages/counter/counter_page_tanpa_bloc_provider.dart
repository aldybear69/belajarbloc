import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/barrel_counter.dart';

class CounterPageTanpaBlocProvider extends StatelessWidget {
  const CounterPageTanpaBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CounterPageTanpaBlocProviderView();
  }
}

class CounterPageTanpaBlocProviderView extends StatelessWidget {
  const CounterPageTanpaBlocProviderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var blocCaraSatu = CounterBloc();
    var blocCaraDua = CBloc();

    return Scaffold(
      appBar: AppBar(title: const Text('Tanpa BlocProvider')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                flex: 1,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Cara Pertama", style: TextStyle(fontSize: 20)),
                    BlocBuilder<CounterBloc, int>(
                      bloc: blocCaraSatu,
                      builder: (context, count) {
                        return Text('$count',
                            style: Theme.of(context).textTheme.headline1);
                      },
                    ),
                  ],
                ))),
            const Divider(
              color: Colors.blue,
            ),
            Flexible(
                flex: 1,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Cara Kedua", style: TextStyle(fontSize: 20)),
                    BlocBuilder<CBloc, CState>(
                      bloc: blocCaraDua,
                      builder: (context, count) {
                        return Text('${count.number}',
                            style: Theme.of(context).textTheme.headline1);
                      },
                    )
                  ],
                )))
          ]),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "FAB increment",
            child: const Icon(Icons.add),
            onPressed: () {
              blocCaraSatu.add(CounterIncrementPressed());
              blocCaraDua.add(CounterIncrementEvent());
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            heroTag: "FAB decrement",
            child: const Icon(Icons.remove),
            onPressed: () {
              blocCaraSatu.add(CounterDecrementPressed());
              blocCaraDua.add(CounterDecrementEvent());
            },
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
