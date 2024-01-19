import 'package:flutter/material.dart';
import 'package:provider_example/model/user.dart';

class ModelProvider extends ChangeNotifier {
  List<User> data = [];
  getAdd(User user) {
    data.add(user);
    notifyListeners();
  }

  getRemove(User user) {
    data.remove(user);
    notifyListeners();
  }
}
