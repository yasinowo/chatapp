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
        //   print(_auth.auth.currentSession?.accessToken);
        await Supabase.instance.client.from('Users').upsert({
          'id': response.user!.id,
          'email': email,
        });
      }
    } catch (error) {
      print('خطا در ورود: $error');
    }
  }

  // sign up
  Future signUpWithEmailAndPassword(String email, password, username) async {
    try {
      final response = await _auth.auth.signUp(
        email: email,
        password: password,
        data: {'username': username},
      );
      print('ورود موفقیت‌آمیز: ${response.user!.email}');
      //save user info in supabase doc
    } on AuthException catch (error) {
      throw ('auth error : ${error.message}');
    } catch (error) {
      throw ('خطا در ورود: ${error.toString()}');
    }
  }

  //sigh out
  Future<void> signOut() async {
    return await _auth.auth.signOut();
  }
}
