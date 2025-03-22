// ignore_for_file: avoid_print

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _auth = Supabase.instance.client;

  // sign in
  Future<void> signInWithEmail(String email, String password) async {
    try {
      final response = await _auth.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        print('ورود موفقیت‌آمیز: ${response.user!.email}');
        //
        //   print(_auth.auth.currentSession?.accessToken);
      }
    } catch (error) {
      print('خطا در ورود: $error');
    }
  }

  // sign up
  Future<AuthResponse> signUpWithEmailAndPassword(
      String email, password) async {
    try {
      final response = await _auth.auth.signUp(
        email: email,
        password: password,
      );
      return response;
    } catch (error) {
      throw ('خطا در ورود: $error');
    }
  }

  //sigh out
  Future<void> signOut() async {
    return await _auth.auth.signOut();
  }
}
