import 'package:chatapp_supabase/auth/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout(BuildContext context) {
    // get auth service
    final _auth = AuthService();
    _auth.signOut();
    // navigate to login page
    // Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          // logout button
          IconButton(
              onPressed: () => logout(context), icon: const Icon(Icons.logout)),
        ],
      ), // AppBar
    ); // Scaffold
  }
}
