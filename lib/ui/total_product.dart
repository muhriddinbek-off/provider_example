import 'package:flutter/material.dart';
import 'package:provider_example/model/product.dart';

// ignore: must_be_immutable
class TotalScreen extends StatefulWidget {
  Products products;
  TotalScreen({super.key, required this.products});

  @override
  State<TotalScreen> createState() => _TotalScreenState();
}

class _TotalScreenState extends State<TotalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total Screen'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(widget.products.name),
            subtitle: Text(widget.products.price.toString()),
          ),
        ],
      ),
    );
  }
}
