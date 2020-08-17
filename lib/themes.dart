import 'package:flutter/material.dart';

class Themes {
  static final darkTheme = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
  );

  static final lightTheme = ThemeData(
    primaryColor: Colors.blue,
    primaryColorDark: Color.fromRGBO(30, 30, 30, 1),
    primaryColorLight: Color.fromRGBO(250, 250, 250, 1),
    disabledColor: Color.fromRGBO(150, 150, 150, 1),
    appBarTheme: AppBarTheme(
      color: Colors.blue,
      actionsIconTheme: IconThemeData(color: Colors.white)
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.black,
      elevation: 8,
    ),
    tabBarTheme: TabBarTheme(
      labelPadding: EdgeInsets.all(0),
      labelColor: Colors.white,
      labelStyle: TextStyle(fontSize: 10),
      unselectedLabelStyle: TextStyle(fontSize: 0),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
  );
}