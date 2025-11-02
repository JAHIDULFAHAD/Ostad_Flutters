import 'package:flutter/cupertino.dart';

import 'counter_controller.dart';

class CounterControllerInheritedWidget extends InheritedWidget {
  final CounterController counterController;

  CounterControllerInheritedWidget({
    super.key,
    required super.child,
    required this.counterController,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static CounterControllerInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CounterControllerInheritedWidget>();
  }
}
