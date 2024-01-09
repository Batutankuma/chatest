import 'package:chatest/pages/message_page.dart';
import 'package:flutter/material.dart';

class DashPage extends StatelessWidget {
  const DashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const MessagePage();
              }));
            },
            title: const Text("data"),
            subtitle: const Text("sssss"),
            leading: const CircleAvatar(),
            trailing: const Icon(Icons.message),
          );
        },
      ),
    );
  }
}
