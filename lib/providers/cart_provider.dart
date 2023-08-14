import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Product> carts = [];

  void addItem(Product item) {
    carts.add(item);
    notifyListeners();
  }

  void removeItem(Product p) {
    carts.remove(p);
    notifyListeners();
  }

  double getTotalPrice() {
    double sum = 0;
    for (Product p in carts) {
      sum += p.price;
    }
    return sum;
  }

  void itemClear() {
    carts.clear();
    notifyListeners();
  }

  int get itemCount => carts.length;
}
