import 'dart:io';

import 'package:chat/models/chat_message.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  static const defaultImage = 'assets/images/avatar.png';
  final ChatMessage message;
  final bool belongToCurrentUser;

  const MessageBubble({super.key, required this.message, required this.belongToCurrentUser});

  Widget _showAvatar(String imageUrl) {
    ImageProvider imageProvider;
    final imageUri = Uri.parse(imageUrl);

    if(imageUrl.contains(defaultImage)) {
      imageProvider = AssetImage(defaultImage);
    } else if (imageUri.scheme.contains('http')) {
      imageProvider = NetworkImage(imageUrl.toString());
    } else {
      imageProvider = FileImage(File(imageUrl.toString()));
    }

    return Positioned(
      top: 0,
      left: belongToCurrentUser ? null : 8,
      right: belongToCurrentUser ? 8 : null,
      child: CircleAvatar(
        backgroundColor: Colors.red,
        backgroundImage: imageProvider,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
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
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
        ),
        _showAvatar(message.userImageUrl),
      ],
    );
  }
}
