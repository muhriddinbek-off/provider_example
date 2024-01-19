import 'package:flutter/material.dart';

class ModelProvider extends ChangeNotifier {
  List<String> data = [];
  getAdd(String value) {
    data.add(value);
    notifyListeners();
  }

  getRemove(String value) {
    data.remove(value);
    notifyListeners();
  }
}
