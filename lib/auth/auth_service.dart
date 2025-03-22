import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  // final Supabase _supabase = Supabase.instance;

  // sign in
  Future<void> signInWithEmail(String email, String password) async {
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        print('ورود موفقیت‌آمیز: ${response.user!.email}');
      }
    } catch (error) {
      print('خطا در ورود: $error');
    }
  }
}
