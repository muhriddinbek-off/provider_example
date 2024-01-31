import 'package:flutter/material.dart';
import 'package:provider_example/model/product.dart';

class ModelProvider extends ChangeNotifier {
  List<Products> info = [
    Products(icons: Icons.home, isSelect: false, price: 40, title: 'Home'),
    Products(icons: Icons.person, isSelect: false, price: 50, title: 'Person'),
    Products(icons: Icons.car_crash, isSelect: false, price: 20, title: 'Car crash'),
    Products(icons: Icons.account_balance, isSelect: false, price: 10, title: 'Account'),
    Products(icons: Icons.ballot, isSelect: false, price: 40, title: 'Ballot'),
    Products(icons: Icons.format_align_center, isSelect: false, price: 70, title: 'Format'),
  ];
}
