import 'package:chatest/config.dart';
import 'package:flutter/material.dart';

class ConnexionPage extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  ConnexionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(250),
          children: [
            TextFormField(
              controller: email,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            TextFormField(
              controller: password,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black),
              ),
              onPressed: () {
                supabase.auth
                    .signInWithPassword(
                        password: password.text, email: email.text)
                    .then((value) {
                  Navigator.pushNamed(context, '/dash');
                }).catchError(
                  // ignore: invalid_return_type_for_catch_error
                  (error) => {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(error.toString()),
                      ),
                    )
                  },
                );
              },
              child: const Center(
                child: Text("Connexion", style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
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
