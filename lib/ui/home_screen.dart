import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model/model.dart';
import 'package:provider_example/model/user.dart';
import 'package:provider_example/ui/add_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController phone = TextEditingController();
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
                    onLongPress: () {
                      title.text = value.data[index].name;
                      phone.text = '${value.data[index].phone}';
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: TextField(
                                      controller: title,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: TextField(
                                      controller: phone,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  TextButton(
                                      onPressed: () {
                                        value.getChange(index, User(name: title.text, phone: int.parse(phone.text)));
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Edit',
                                        style: TextStyle(fontSize: 30),
                                      ))
                                ],
                              ),
                            );
                          });
                    },
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
