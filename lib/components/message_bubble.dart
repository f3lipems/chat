import 'package:chat/models/chat_message.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool belongToCurrentUser;

  const MessageBubble({super.key, required this.message, required this.belongToCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: belongToCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: belongToCurrentUser ? Colors.grey[300] : Theme.of(context).primaryColorDark,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: belongToCurrentUser ? Radius.circular(12) : Radius.circular(0),
              bottomRight: belongToCurrentUser ? Radius.circular(0) : Radius.circular(12),
            ),
          ),
          width: 300,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            children: [
              Text(
                message.userName,
                style: TextStyle(fontWeight: FontWeight.bold, color: belongToCurrentUser ? Colors.black : Colors.white),
              ),
              Text(message.text, style: TextStyle(color: belongToCurrentUser ? Colors.black : Colors.white)),
            ],
          ),
        ),
      ],
    );
  }
}
