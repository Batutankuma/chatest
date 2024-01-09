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
                      print(messages[index].send);
                      print(messages[index].recev);
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
                  return Text("Loading ...");
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
                                SnackBar(content: Text("Message envoyer")));
                          }).catchError((error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Une erreur d'envoie")));
                          });
                        },
                        icon: Icon(Icons.message)))
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
    if (messages.recev == compteModel.uid &&
        messages.send == supabase.auth.currentUser?.id) {
      return Align(
        alignment: Alignment.centerRight,
        child: ListTile(
          title: Text(messages.message),
          leading: CircleAvatar(
            child: Center(child: Text(compteModel.email[0])),
          ),
        ),
      );
    } else if (messages.recev == supabase.auth.currentUser?.id &&
        messages.send == compteModel.uid) {
      return ListTile(
        title: Text(messages.message),
        leading: CircleAvatar(
          child: Center(child: Text(supabase.auth.currentUser!.email![0])),
        ),
      );
    }
    return const Text("");
  }
}

/**
 * return SizedBox(
      child: supabase.auth.currentUser?.id != user
          ? Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  CircleAvatar(
                    child: Center(
                      child: Text(supabase.auth.currentUser!.email![0]),
                    ),
                  ),
                  Container(
                    color: Colors.amber,
                    child: Text(message),
                  )
                ],
              ),
            )
          : Align(
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  CircleAvatar(
                    child: Center(
                      child: Text(supabase.auth.currentUser!.email![0]),
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    child: Text(message),
                  )
                ],
              ),
            ),
    );
 */

/**return Align(
                        alignment: Alignment.centerLeft,
                        child: Text("H"),
                      );*/