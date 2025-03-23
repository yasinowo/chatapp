import 'package:chatapp_supabase/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

final supabase = Supabase.instance.client;

class ChatPage2 extends StatefulWidget {
  const ChatPage2({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const ChatPage2(),
    );
  }

  @override
  State<ChatPage2> createState() => _ChatPage2State();
}

class _ChatPage2State extends State<ChatPage2> {
  Stream<List<Message>> _messagesStream = Stream.empty(); // مقدار اولیه
  final Map<String, Profile> _profileCache = {};
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initializeMessagesStream();
  }

  void _initializeMessagesStream() {
    final user = supabase.auth.currentUser;
    if (user == null) {
      print("❌ خطا: کاربر لاگین نکرده است.");
      return;
    }
    final myUserId = user.id;

    setState(() {
      _messagesStream = supabase
          .from('messages')
          .stream(primaryKey: ['id'])
          .order('created_at')
          .map((maps) => maps
              .map((map) => Message.fromMap(map: map, myUserId: myUserId))
              .toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Message>>(
              stream: _messagesStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final messages = snapshot.data!;
                if (messages.isEmpty) {
                  return const Center(child: Text("شروع به چت کنید 📩"));
                }
                return ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(message: messages[index]);
                  },
                );
              },
            ),
          ),
          _buildMessageBar(),
        ],
      ),
    );
  }

  Widget _buildMessageBar() {
    final TextEditingController textController = TextEditingController();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: "پیام خود را تایپ کنید...",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () async {
                final text = textController.text.trim();
                if (text.isEmpty) return;

                final user = supabase.auth.currentUser;
                if (user == null) return;

                textController.clear();
                await supabase.from('messages').insert({
                  'profile_id': user.id,
                  'content': text,
                  'created_at': DateTime.now().toIso8601String(),
                });

                Future.delayed(const Duration(milliseconds: 300), () {
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final Message message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMine = message.isMine;
    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isMine ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment:
              isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message.content,
              style: TextStyle(color: isMine ? Colors.white : Colors.black),
            ),
            Text(
              timeago.format(message.createdAt, locale: 'fa'),
              style: TextStyle(fontSize: 10, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final String id;
  final String profileId;
  final String content;
  final DateTime createdAt;
  final bool isMine;

  Message({
    required this.id,
    required this.profileId,
    required this.content,
    required this.createdAt,
    required this.isMine,
  });

  factory Message.fromMap(
      {required Map<String, dynamic> map, required String myUserId}) {
    return Message(
      id: map['id'].toString(),
      profileId: map['profile_id'],
      content: map['content'],
      createdAt: DateTime.parse(map['created_at']),
      isMine: map['profile_id'] == myUserId,
    );
  }
}
