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
              decoration: const InputDecoration(hintText: "Email"),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Password"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black),
              ),
              onPressed: () => Navigator.pushNamed(context, '/dash'),
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
