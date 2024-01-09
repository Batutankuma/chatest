import 'package:flutter/material.dart';

class InscriptionPage extends StatelessWidget {
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
          padding: const EdgeInsets.all(250),
          children: [
            const Text("Inscription"),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(hintText: "Email"),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "LastName"),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Password"),
            ),
            const SizedBox(height: 10),
            const ElevatedButton(
              onPressed: null,
              child: Center(
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
