import 'package:chatest/config.dart';
import 'package:chatest/models/diagramme.dart';
import 'package:chatest/services/users_services.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessagePage extends StatelessWidget {
  final CompteModel compteModel;

  MessagePage({super.key, required this.compteModel});

  TextEditingController messageCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: SizedBox(
            child: FutureBuilder(
              future: supabase.from('message').select("*"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<MessagModel> messages =
                      MessagModel.listmessage(snapshot.data);
                  return ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      if (messages[index].recev == compteModel.uid &&
                          messages[index].send ==
                              supabase.auth.currentUser?.id) {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: Text(messages[index].message),
                        );
                      } else if (messages[index].recev ==
                              supabase.auth.currentUser?.id &&
                          messages[index].send == compteModel.uid) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Text(messages[index].message),
                        );
                      }
                    },
                  );
                } else {
                  return const Text("Loading ...");
                }
              },
            ),
          )),
          SizedBox(
            height: 80,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration:
                        const InputDecoration(hintText: "Laissez un message"),
                    controller: messageCtr,
                  ),
                ),
                Expanded(
                    child: IconButton(
                        onPressed: () {
                          UserService.message(compteModel.uid, messageCtr.text)
                              .then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Message envoyer")));
                          }).catchError((error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Une erreur d'envoie")));
                          });
                        },
                        icon: const Icon(Icons.message)))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget messageBold(MessagModel messages) {
    return ListTile(
      title: Text(messages.message),
      leading: CircleAvatar(
        child: Center(child: Text(compteModel.email[0])),
      ),
    );
  }
}
