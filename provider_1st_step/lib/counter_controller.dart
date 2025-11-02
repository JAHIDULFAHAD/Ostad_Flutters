import 'package:flutter/cupertino.dart';

class CounterController extends ChangeNotifier {
  int count =0;

  void increment(){
    count++;
    notifyListeners();
  }

  void decrement(){
    count--;
    notifyListeners();
  }

}