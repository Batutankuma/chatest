import 'package:chatest/pages/connexion_page.dart';
import 'package:chatest/pages/dash_page.dart';
import 'package:chatest/pages/inscription_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: "https://dodyarvagwwjmnvfmegw.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRvZHlhcnZhZ3d3am1udmZtZWd3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQ4MTYxNzMsImV4cCI6MjAyMDM5MjE3M30.tGXMJnV8ptcK-7Elv9s7JarbMWwpOvhDJW_edSl4wY4");
  runApp(MyApp());
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
        '/dash': (context) => const DashPage()
      },
    );
  }
}
