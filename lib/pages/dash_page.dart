import 'package:chatest/config.dart';
import 'package:chatest/models/diagramme.dart';
import 'package:chatest/pages/message_page.dart';
import 'package:flutter/material.dart';

class DashPage extends StatelessWidget {
  const DashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: supabase
            .from('compte')
            .select('*')
            .neq("id", supabase.auth.currentSession!.user.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CompteModel> listitem = CompteModel.listcompte(snapshot.data);
            return ListView.builder(
              itemCount: listitem.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const MessagePage();
                    }));
                  },
                  title: Text(listitem[index].name),
                  subtitle: Text(listitem[index].email),
                  leading: CircleAvatar(
                      child: Center(
                    child: Text(listitem[index].name[0]),
                  )),
                  trailing: const Icon(Icons.message),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

/**
 * ListView.builder(
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
      )
 */