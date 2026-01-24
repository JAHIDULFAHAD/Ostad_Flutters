import 'package:flutter/cupertino.dart';


class MainNavContainerProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeItem(int index) {
    if (index == _selectedIndex) return;
    _selectedIndex = index;
    notifyListeners();
  }

  void changeToCategory() {
    changeItem(1);
  }

  void backToHome() {
    changeItem(0);
  }
}
