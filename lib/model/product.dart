import 'package:flutter/material.dart';

class Products {
  IconData icons;
  String title;
  int price;
  bool isSelect;
  Products({
    required this.icons,
    required this.isSelect,
    required this.price,
    required this.title,
  });
}
