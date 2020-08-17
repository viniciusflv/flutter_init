import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_init/providers/Utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_init/providers/Counter/Cubit.dart';
import 'package:flutter_init/providers/Providers.dart';
import 'package:flutter_init/providers/Theme/Cubit.dart';

class HomePage extends StatelessWidget with Utils {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: edgeInsets('10'),
          child: SvgPicture.asset(
            'lib/assets/svg/cat.svg',
            color: Colors.white,
            semanticsLabel: 'Cat'
          ),
        ),
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () => Navigator.pushNamed(context, 'counter'),
          ),
        ],
      ),
      body: Providers.connector<CounterCubit, int>((count) => Center(
            child: Text('$count', style: Theme.of(context).textTheme.headline1),
          )),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: const Icon(Icons.brightness_6),
              onPressed: () => context.bloc<ThemeCubit>().toggleTheme(),
            ),
          ),
        ],
      ),
    );
  }
}
