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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Products'),
      ),
      body: Consumer<ModelProvider>(
        builder: (context, value, child) {
          return GridView.builder(
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
            ),
            itemCount: value.info.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TotalScreen(products: value.info[index]),
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white, boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    )
                  ]),
                  child: Column(
                    children: [
                      Container(padding: const EdgeInsets.all(20), child: Icon(value.info[index].icons, size: 50)),
                      ListTile(
                        title: Text(value.info[index].title),
                        subtitle: Text("\$ ${value.info[index].price}"),
                        trailing: const Icon(Icons.favorite),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
