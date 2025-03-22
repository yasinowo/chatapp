import 'package:chatapp_supabase/page/home_page.dart';
import 'package:chatapp_supabase/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          // ✅ اگر کاربر لاگین کرده باشد
          if (snapshot.hasData) {
            return const HomePage();
          }

          // ❌ در غیر این صورت، به صفحه لاگین برو
          return LoginPage();
        },
      ),
    );
  }
}
