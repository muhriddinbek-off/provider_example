import 'package:flutter/material.dart';
import 'package:provider_example/model/product.dart';
import 'package:provider_example/model/user.dart';

class ModelProvider extends ChangeNotifier {
  List<Products> info = [
    Products(name: 'Boll', price: 50),
    Products(name: 'Head', price: 40),
    Products(name: 'Skite', price: 70),
    Products(name: 'Phone', price: 20),
    Products(name: 'Headphones', price: 90),
    Products(name: 'Flower', price: 10),
    Products(name: 'Apple', price: 60),
  ];
  List<User> data = [];
  getAdd(User user) {
    data.add(user);
    notifyListeners();
  }

  getRemove(User user) {
    data.remove(user);
    notifyListeners();
  }

  getChange(int index, User user) {
    data.removeAt(index);
    data.insert(index, user);
    notifyListeners();
  }
}
