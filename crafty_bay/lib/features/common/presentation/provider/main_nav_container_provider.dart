import 'package:flutter/cupertino.dart';

class MainNavContainerProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void  changeIndex(int index) {
    if (index == _selectedIndex) return;
    _selectedIndex = index;
    notifyListeners();
  }

  void changeToCategory() {
    changeIndex(1);
  }
  void backToHome() {
    changeIndex(0);
  }

}