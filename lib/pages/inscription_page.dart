import 'package:chatest/services/users_services.dart';
import 'package:flutter/material.dart';

class InscriptionPage extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  InscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(50),
          children: [
            const Text("Inscription"),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(hintText: "Name"),
              controller: name,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Email"),
              controller: email,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Password"),
              controller: password,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                UserService.signUp(password.text, email.text, name.text)
                    .then((value) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(value.toString()),
                    backgroundColor: Colors.green,
                  ));
                }).catchError((error) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(error.toString()),
                    backgroundColor: Colors.red,
                  ));
                });
              },
              child: const Center(
                child: Text(
                  "Inscription",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
