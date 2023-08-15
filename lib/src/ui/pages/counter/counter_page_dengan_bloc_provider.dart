import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/barrel_counter.dart';

class CounterPageDenganBlocProvider extends StatelessWidget {
  const CounterPageDenganBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //menggunakan multiblocprovider karena ada cara 1 dan cara 2 sekaligus
    //cara 1 = menggunakan cara simple hanya butuh file bloc dan file event saja
    //cara 2 = sesuai template extensi vscode menggunakan file bloc, file event, dan file state
    //atau untuk menggunakan banyak bloc sekaligus
    return MultiBlocProvider(providers: [
      //BlocProvider sendiri digunakan untuk menggunakan bloc pada seluruh anak widget dibawahnya
      //tanpa harus menginisialiasi local bloc (var a = new blockA() dsb)
      BlocProvider(
        create: (_) => CounterBloc(),
      ),
      BlocProvider(
        create: (_) => CBloc(),
      )
    ], child: const CounterPageView());
  }
}

class CounterPageView extends StatelessWidget {
  const CounterPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(">>>>> BUILD"); //jika pake context.watch akan rebuild trs
    // ! dibawah ini adalah cara optional yg
    // ! bisa dilakukan untuk menjalankan perintah bloc nya
    // ! syaratnya harus ada BlocProvider digunakan
    // ! untuk context.read sama dengan listen = false
    // ! untuk context.watch sama dengan listen = true
    // ! bedanya = watch memantau seluruh class nya
    // ! dan watch itu selalu rebuild seluruh widget
    // //versi lama
    // var cara1A = BlocProvider.of<CounterBloc>(context, listen: true);
    // //versi pendek
    // var cara1B = context.watch<CounterBloc>();
    // //versi lama
    // var cara2A = BlocProvider.of<CBloc>(context, listen: true);
    // //versi pendek
    // var cara2B = context.watch<CBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text('Dengan BlocProvider')),
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
              //cara 1
              context.read<CounterBloc>().add(CounterIncrementPressed());
              //cara 2
              context.read<CBloc>().add(CounterIncrementEvent());
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            heroTag: "FAB decrement",
            child: const Icon(Icons.remove),
            onPressed: () {
              //cara 1
              context.read<CounterBloc>().add(CounterDecrementPressed());
              //cara 2
              context.read<CBloc>().add(CounterDecrementEvent());
            },
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
