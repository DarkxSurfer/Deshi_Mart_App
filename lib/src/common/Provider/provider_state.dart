import 'package:flutter/material.dart';

import '../../view/Home/Item Models/fruits_model_list.dart';


class FavouriteItem with ChangeNotifier {
  final List<ItemModel> _itemListOne = [
    const ItemModel(productId: '1', productName: 'Red Apple', productDescription: '1kg, Price', productThumbNail: 'assets/Fruits/pngfuel 1.png', unitPrice: '\$4.99'),
    const ItemModel(productId: '2', productName: 'Organic Banana', productDescription: '250gm, Price', productThumbNail: 'assets/Fruits/banana .png', unitPrice: '\$4.99'),
  ];  final List<ItemModel> _itemListTwo = [

    const ItemModel(productId: '3', productName: 'Bell Pepper Red', productDescription: '1kg, Price', productThumbNail: 'assets/Fruits/Shemla.png', unitPrice:'\$4.99'),
    const ItemModel(productId: '4', productName: 'Ginger', productDescription: '1kg, Price', productThumbNail: 'assets/Fruits/pngfuel 3.png', unitPrice:'\$4.99'),
  ]; final List<ItemModel> _itemListThree = [

    const ItemModel(productId: '5', productName: 'Beef Bone', productDescription: '1kg, Price', productThumbNail: 'assets/Fruits/pngfuel 4.png', unitPrice:'\$4.99'),
    const ItemModel(productId: '6', productName: 'Broiler Chicken', productDescription: '1kg, Price', productThumbNail: 'assets/Fruits/pngfuel 5.png', unitPrice:'\$4.99'),
  ];
  final List<String> _fruitsList = ['Apple', 'Banana', 'Mango', 'Peach', 'Melon', 'Watermelon'];
  final List<String> _priceList = ['Rs: 20', 'Rs: 40', 'Rs: 65', 'Rs: 80', 'Rs: 90', 'Rs: 120'];

  final List<String> _selectedFavourites = []; // Track selected favourite items
  final Map<String, int> _itemQuantities = {}; // Track quantities of selected items

  List<ItemModel> get itemListOne => _itemListOne;
  List<ItemModel> get itemListTwo => _itemListTwo;
  List<ItemModel> get itemListThree => _itemListThree;
  List<String> get fruitsList => _fruitsList;
  List<String> get priceList => _priceList;
  List<String> get selectedFavourites => _selectedFavourites;
  Map<String, int> get itemQuantities => _itemQuantities;

  void addFruit(String fruit) {
    _fruitsList.add(fruit);
    notifyListeners();
  }

  void favouriteSelected(String item) {
    if (_selectedFavourites.contains(item)) {
      _selectedFavourites.remove(item);
      _itemQuantities.remove(item); // Remove quantity if item is deselected
    } else {
      _selectedFavourites.add(item);
      if (_itemQuantities[item] == null) {
        _itemQuantities[item] = 1; // Initialize quantity to 1 if not already set
      }
    }
    notifyListeners(); // Notify listeners about the change
  }

  void updateQuantity(String item, int newQuantity) {
    if (_selectedFavourites.contains(item) && newQuantity >= 1) {
      _itemQuantities[item] = newQuantity;
      notifyListeners(); // Notify listeners about the change
    }
  }

  int get selectedFavouritesCount => _selectedFavourites.length;

  String getTotalPrice() {
    double total = 0;
    for (String fruit in _selectedFavourites) {
      int index = _fruitsList.indexOf(fruit);
      if (index != -1) {
        String priceStr = _priceList[index].replaceAll('Rs: ', '');
        int price = int.tryParse(priceStr) ?? 0; // Use 0 as default if parsing fails
        int quantity = _itemQuantities[fruit] ?? 1; // Use 1 as default if quantity is not set
        total += price * quantity;
      }
    }
    return 'Rs: ${total.toStringAsFixed(2)}';

  }

}
