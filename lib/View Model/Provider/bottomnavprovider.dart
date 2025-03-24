import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier {
  int selectedIndex = 0;
  bool showCheckout = false; // Controls Checkout Screen visibility

  void changeIndex(int index) {
    selectedIndex = index;
    showCheckout = false; // Hide checkout when switching tabs
    notifyListeners();
  }

  void toggleCheckoutScreen() {
    showCheckout = true;
    notifyListeners();
  }

  void hideCheckoutScreen() {
    showCheckout = false;
    notifyListeners();
  }
}
