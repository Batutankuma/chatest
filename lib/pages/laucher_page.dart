import 'package:flutter/material.dart';

class LaucherPage extends StatelessWidget {
  const LaucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //title application
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black)),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/login'),
              child: const Center(
                child: Text(
                  "Commencer",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
