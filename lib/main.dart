import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_init/providers/Providers.dart';
import 'package:flutter_init/providers/Observer.dart';
import 'package:flutter_init/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(_) => MultiBlocProvider(
        providers: Providers.global,
        child: Providers.connector<ThemeCubit, ThemeData>(
          (theme) => MaterialApp(
            title: 'Animais',
            initialRoute: 'home',
            theme: theme,
            routes: Routes.named,
          ),
        ),
      );
}

void main() {
  Bloc.observer = Observer();
  runApp(App());
}
