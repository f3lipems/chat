import 'package:chat/components/message_bubble.dart';
import 'package:chat/models/chat_message.dart';
import 'package:chat/services/auth/auth_service.dart';
import 'package:chat/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().currentUser;

    return StreamBuilder<List<ChatMessage>>(
      stream: ChatService().messagesStream(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Não há mensagens'));
        } else {
          final msgs = snapshot.data;
          return ListView.builder(
            reverse: true,
            itemCount: msgs!.length,
            itemBuilder: (ctx, index) {
              final message = msgs[index];
              return MessageBubble(
                key: ValueKey(msgs[index].id),
                message: msgs[index],
                belongToCurrentUser: msgs[index].userId == currentUser?.id,
              );
            },
          );
        }
      },
    );
  }
}
