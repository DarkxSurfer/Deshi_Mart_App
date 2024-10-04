import 'package:deshi_mart_app/src/view/Home/Item%20Models/fruits_model_list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavotriteProductProvider with ChangeNotifier {
  List<FavoriteProduct> _products = []; // Your list of products

  List<FavoriteProduct> get favoriteProducts => _products;

  void toggleFavorite(String productId) async {
    final productIndex = _products.indexWhere((prod) => prod.id == productId);
    if (productIndex >= 0) {
      _products[productIndex].isFavorite = !_products[productIndex].isFavorite;
      notifyListeners();

      // Save favorite state in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool(productId, _products[productIndex].isFavorite);
    }
  }

  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var product in _products) {
      product.isFavorite = prefs.getBool(product.id) ?? false;
    }
    notifyListeners();
  }
}

class FavoriteProduct {
  final String id;
  final String name;
  final String description;
  final double price;
  bool isFavorite;

  FavoriteProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.isFavorite = false, // Default to false
  });
}
