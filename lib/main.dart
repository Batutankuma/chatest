import 'package:chatest/pages/connexion_page.dart';
import 'package:chatest/pages/dash_page.dart';
import 'package:chatest/pages/inscription_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ConnexionPage(),
        '/signup': (context) => InscriptionPage(),
        '/dash': (context) => DashPage()
      },
    );
  }
}
