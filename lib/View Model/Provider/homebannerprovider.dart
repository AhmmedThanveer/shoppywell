import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_controller.dart';

class Homesliderprovider extends ChangeNotifier {
  final CarouselSliderController carouselController =
      CarouselSliderController(); // Controller

  int _currentPage = 0; // Current page index
  int get currentPage => _currentPage;

  bool _isLoading = false; // Loading state
  bool get isLoading => _isLoading;

  String? _errorMessage; // Error message
  String? get errorMessage => _errorMessage;

  // Update the current page index
  void updateCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }
}
