import 'package:chatapp_supabase/components/drawer_global.dart';
import 'package:chatapp_supabase/services/auth/auth_service.dart';
import 'package:chatapp_supabase/services/chat/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  //chat & auth services
  final AuthService _authService = AuthService();
  final ChatService _chatService = ChatService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerGlobal(),
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 92.w),
          child: const Text("Home"),
        ),
        actions: [
          // logout button
        ],
      ),
      body: StreamBuilder(
        stream: _chatService.getUsersStream(),
        builder: (context, snapshot) {
          // error
          if (snapshot.hasError) {
            return const Text("Error");
          }

          // loading..
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading..");
          }

          // return list view
          return ListView(
            children: snapshot.data!
                .map<Widget>((userData) => _buildUserListItem(userData))
                .toList(),
          ); // ListView
        },
      ),
    );
  }
}
