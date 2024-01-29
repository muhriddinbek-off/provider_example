import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model/model.dart';
import 'package:provider_example/model/user.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController controller = TextEditingController();

  TextEditingController controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: controller1,
              decoration: const InputDecoration(
                hintText: 'Phone number',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<ModelProvider>().getAdd(User(name: controller.text, phone: int.parse(controller1.text)));
        Navigator.pop(context);
      }),
    );
  }
}
