import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model/model.dart';
import 'package:provider_example/ui/add_user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
      ),
      body: Consumer<ModelProvider>(
        builder: (context, value, child) {
          if (value.data.isEmpty) {
            return const Center(
                child: Text(
              'Listda malumot yo\'q',
              style: TextStyle(fontSize: 30),
            ));
          } else {
            return ListView.builder(
                itemCount: value.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(value.data[index].name),
                    subtitle: Text(value.data[index].phone.toString()),
                    trailing: IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: () {
                        context.read<ModelProvider>().getRemove(value.data[index]);
                      },
                    ),
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddUser()));
      }),
    );
  }
}
