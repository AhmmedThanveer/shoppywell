import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopywell/Models/productsmodel.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> _cartProducts = []; // List for cart items
  bool _isLoading = false;

  List<Product> get products => _products;
  List<Product> get cartProducts => _cartProducts; // Getter for cart
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('products').get();

      _products =
          querySnapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
    } catch (e) {
      print("Error fetching products: $e");
    }

    _isLoading = false;
    notifyListeners();
  }

  // Add to cart method
  void addToCart(Product product) {
    _cartProducts.add(product);
    notifyListeners();
  }
}
