import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';
import './Utils.dart';

class Observer extends BlocObserver with Utils {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    bool shouldConvert(obj) =>
        obj is Map || obj is String || obj is int || obj is double;
    isList(obj) =>
        obj is List ? obj.map((c) => c.toMap()).toList() : obj.toMap();
    log(
      jsonStringfy({
        'prev': shouldConvert(transition.currentState)
            ? transition.currentState
            : isList(transition.currentState),
        'next': shouldConvert(transition.nextState)
            ? transition.nextState
            : isList(transition.nextState),
      }),
      name: '${transition.event.action.toString().split('.')[1]}',
    );
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    super.onError(cubit, error, stackTrace);
    print('error => $error');
  }
}
