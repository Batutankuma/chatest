import 'package:flutter/material.dart';

class DashPage extends StatelessWidget {
  const DashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text("data"),
            subtitle: Text("sssss"),
            leading: CircleAvatar(),
            trailing: Icon(Icons.message),
          );
        },
      ),
    );
  }
}
