import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_init/providers/Counter/Cubit.dart';
import 'package:flutter_init/providers/Theme/Cubit.dart';

export 'package:flutter_init/providers/Counter/Cubit.dart';
export 'package:flutter_init/providers/Theme/Cubit.dart';

class Providers {
  static Widget connector<CubitResource extends Cubit<Model>, Model>(
    Widget Function(Model) cb,
  ) => BlocBuilder<CubitResource, Model>(builder: (_, resource) => cb(resource));

  static List<BlocProvider<Cubit<dynamic>>> global = [
    BlocProvider<CounterCubit>(create: (_) => CounterCubit()),
    BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
  ];
}
