import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_init/themes.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(Themes.lightTheme);

  void toggleTheme() {
    emit(state.brightness == Brightness.dark
        ? Themes.lightTheme
        : Themes.darkTheme);
  }
}
