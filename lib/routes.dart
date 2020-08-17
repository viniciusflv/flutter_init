import 'package:flutter/material.dart';
import 'package:flutter_init/pages/_index.dart';

class Routes {
  static final Map<String, Widget Function(BuildContext)> named = {
    'home': (BuildContext context) => HomePage(),
    'counter': (BuildContext context) => CounterPage(),
  };
}
