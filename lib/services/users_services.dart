import 'package:chatest/config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserService {
  static login(String password, String email) async {
    try {
      AuthResponse data = await supabase.auth
          .signInWithPassword(password: password, email: email);
      return "${data.session}";
    } catch (e) {
      return "Veuillez verifiez votre Mot de Passe ou Email est incorrect!";
    }
  }

  static Future<String> signUp(
      String password, String email, String name) async {
    try {
      AuthResponse data =
          await supabase.auth.signUp(password: password, email: email);
      await supabase
          .from('compte')
          .insert({"name": name, "email": email, "id": data.user!.id});
      return "Hello";
    } catch (e) {
      return "Veuillez verifiez votre Mot de Passe ou Email est incorrect!";
    }
  }
}
