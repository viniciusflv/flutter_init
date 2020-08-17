import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_init/providers/Counter/Cubit.dart';
import 'package:flutter_init/providers/Providers.dart';
import 'package:flutter_init/providers/Theme/Cubit.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animais')),
      body: Providers.connector<CounterCubit, int>((count) => Center(
        child: Text('$count',
        style: Theme.of(context).textTheme.headline1),
      )),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "btn1",
              child: const Icon(Icons.add),
              onPressed: () =>
                  context.bloc<CounterCubit>().add(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "btn2",
              child: const Icon(Icons.remove),
              onPressed: () =>
                  context.bloc<CounterCubit>().remove(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "btn3",
              child: const Icon(Icons.brightness_6),
              onPressed: () => context.bloc<ThemeCubit>().toggleTheme(),
            ),
          ),
        ],
      ),
    );
  }
}