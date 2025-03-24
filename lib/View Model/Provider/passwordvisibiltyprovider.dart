import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordVisibilityProvider extends ChangeNotifier {
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void toggleVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}
