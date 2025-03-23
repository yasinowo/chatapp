import 'package:chatapp_supabase/auth/auth_service.dart';
import 'package:chatapp_supabase/components/drawer_global.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout(BuildContext context) {
    // get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerGlobal(),
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
