import 'package:chatapp_supabase/services/auth/auth_gate.dart';
import 'package:chatapp_supabase/page/login_page.dart';
import 'package:chatapp_supabase/page/register_page.dart';
import 'package:chatapp_supabase/theme/light_mod.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://fuwxrwsrflpahrtjmgyq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ1d3hyd3NyZmxwYWhydGptZ3lxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI2NTU5MzYsImV4cCI6MjA1ODIzMTkzNn0.Ajc3XOLdlSCyekSJLx3_bdDrTqcHftt5D0uRHEyifhA',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          //  navigatorKey: globalKey,
          title: 'title',
          // You can use the library anywhere in the app even in theme
          theme: lightMode,
          home: child,
          routes: {
            '/login': (context) => LoginPage(),
            '/register': (context) => RegisterPage(),
          },
        );
      },
      child: AuthGate(),
    );
  }
}
