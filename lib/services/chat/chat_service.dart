import 'package:supabase_flutter/supabase_flutter.dart';

class ChatService {
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return Supabase.instance.client
        .from('Users') // نام جدول در Supabase
        .stream(
      primaryKey: ['id'],
    ) // 'id' را به عنوان کلید اصلی مشخص کنید (در صورت وجود)
        .map((maps) {
      return maps;
    });
  }
}
