import 'package:flutter/cupertino.dart';

class CartModel extends ChangeNotifier {
  // list of items in the cart
  final List<String> _items = [];

  List<String> get items => _items;

  // add an item to the cart
  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }

  // remove an item from the cart 
  void removeItem(String item) {
    _items.remove(item);
    notifyListeners();
  }

  // remove all items from the cart
  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
