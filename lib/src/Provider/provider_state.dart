import 'package:flutter/material.dart';

import '../view/Home/Item Models/fruits_model_list.dart';

class FavouriteItem with ChangeNotifier {
  final List<ItemModel> _itemListOne = [
    ItemModel(
        productId: '1',
        productName: 'Red Apple',
        productDescription: '1kg, Price',
        productThumbNail: 'assets/Fruits/pngfuel 1.png',
        unitPrice: '\$4.99'),
    ItemModel(
        productId: '2',
        productName: 'Dry Fruits',
        productDescription: '250gm, Price',
        productThumbNail: 'assets/Fruits/driFruits.png',
        unitPrice: '\$3.99'),
  ];
  final List<ItemModel> _itemListTwo = [
    ItemModel(
        productId: '3',
        productName: 'Bell Pepper Red',
        productDescription: '2kg, Price',
        productThumbNail: 'assets/Fruits/Shemla.png',
        unitPrice: '\$5.99'),
    ItemModel(
        productId: '4',
        productName: 'Ginger',
        productDescription: '500gm, Price',
        productThumbNail: 'assets/Fruits/pngfuel 3.png',
        unitPrice: '\$6.99'),
  ];
  final List<ItemModel> _itemListThree = [
    ItemModel(
        productId: '5',
        productName: 'Beef Bone',
        productDescription: '2kg, Price',
        productThumbNail: 'assets/Fruits/pngfuel 4.png',
        unitPrice: '\$7.99'),
    ItemModel(
        productId: '6',
        productName: 'Broiler Chicken',
        productDescription: '1kg, Price',
        productThumbNail: 'assets/Fruits/pngfuel 5.png',
        unitPrice: '\$8.99'),
  ];
  final List<String> _fruitsList = [
    'Apple',
    'Banana',
    'Mango',
    'Peach',
    'Melon',
    'Watermelon'
  ];
  final List<String> _priceList = [
    'Rs: 20',
    'Rs: 40',
    'Rs: 65',
    'Rs: 80',
    'Rs: 90',
    'Rs: 120'
  ];

  // final List<String> _selectedFavourites = []; // Track selected favourite items
  final Map<String, int> _itemQuantities =
      {}; // Track quantities of selected items

  List<ItemModel> get itemListOne => _itemListOne;
  List<ItemModel> get itemListTwo => _itemListTwo;
  List<ItemModel> get itemListThree => _itemListThree;
  List<String> get fruitsList => _fruitsList;
  List<String> get priceList => _priceList;
  // List<String> get selectedFavourites => _selectedFavourites;
  Map<String, int> get itemQuantities => _itemQuantities;

  void addFruit(String fruit) {
    _fruitsList.add(fruit);
    notifyListeners();
  }

  final List<ItemModel> _selectedFavourites =
      []; // Track selected favourite items

  List<ItemModel> get selectedFavourites => _selectedFavourites;

  void favouriteSelected(ItemModel item) {
    if (_selectedFavourites.contains(item)) {
      _selectedFavourites.remove(item);
      _itemQuantities
          .remove(item.productId); // Remove quantity if item is deselected
    } else {
      _selectedFavourites.add(item);
      if (_itemQuantities[item.productId] == null) {
        _itemQuantities[item.productId!] =
            1; // Initialize quantity to 1 if not already set
      }
    }
    notifyListeners();
  }

  void removeFromFavourites(ItemModel item) {
    _selectedFavourites.remove(item);
    _itemQuantities
        .remove(item.productId); // Optionally remove quantity as well
    notifyListeners(); // Notify UI to rebuild
  }

  // void favouriteSelected(String item) {
  //   if (_selectedFavourites.contains(item)) {
  //     _selectedFavourites.remove(item);
  //     _itemQuantities.remove(item); // Remove quantity if item is deselected
  //   } else {
  //     _selectedFavourites.add(item);
  //     if (_itemQuantities[item] == null) {
  //       _itemQuantities[item] = 1; // Initialize quantity to 1 if not already set
  //     }
  //   }
  //   notifyListeners(); // Notify listeners about the change
  // }
  void updateQuantity(ItemModel item, int newQuantity) {
    // Check if the item exists in the selected favourites and the new quantity is valid
    if (_selectedFavourites.contains(item) && newQuantity >= 1) {
      _itemQuantities[item.productId!] =
          newQuantity; // Update quantity based on product ID
      notifyListeners(); // Notify UI to rebuild with updated quantity
    }
  }

  int get selectedFavouritesCount => _selectedFavourites.length;
  String getTotalPrice() {
    double total = 0;

    // Iterate over selected favourites which now contains ItemModel objects
    for (ItemModel item in _selectedFavourites) {
      String priceStr = item.unitPrice
          .replaceAll('', '')
          .replaceAll('\$', ''); // Remove currency symbol
      double price =
          double.tryParse(priceStr) ?? 0; // Use 0 as default if parsing fails

      // Get the quantity from the map, or default to 1
      int quantity = _itemQuantities[item.productId] ?? 1;

      // Calculate total for this item
      total += price * quantity;
    }

    return '\$: ${total.toStringAsFixed(2)}';
  }
}
