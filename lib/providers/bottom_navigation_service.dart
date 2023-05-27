import 'package:flutter/cupertino.dart';

class BottomNavigationService extends ChangeNotifier {
  int selectedTabIndex = 0;

  void setSelectedTabIndex(index) {
    selectedTabIndex = index;
    notifyListeners();
  }
}