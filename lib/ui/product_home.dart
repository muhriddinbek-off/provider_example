import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model/model.dart';
import 'package:provider_example/ui/total_product.dart';

class ProductsHome extends StatefulWidget {
  const ProductsHome({super.key});

  @override
  State<ProductsHome> createState() => _ProductsHomeState();
}

class _ProductsHomeState extends State<ProductsHome> {
  @override
  Widget build(BuildContext context) {
    final data = context.watch<ModelProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Products'),
      ),
      body: ListView.builder(
        itemCount: data.info.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TotalScreen(products: data.info[index]);
              }));
            },
            title: Text(data.info[index].name),
            subtitle: Text(data.info[index].price.toString()),
          );
        },
      ),
    );
  }
}
