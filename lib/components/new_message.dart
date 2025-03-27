import 'package:chat/models/chat_message.dart';
import 'package:chat/services/auth/auth_service.dart';
import 'package:chat/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  String _enteredMessage = '';
  final _controller = TextEditingController();

  Future<void> _sendMessage() async {
    final user = AuthService().currentUser;

    if (user != null) {
      await ChatService().save(_enteredMessage, user);
      _controller.clear();
      setState(() {
        _enteredMessage = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: (value) => setState(() => _enteredMessage = value),
              onSubmitted: (_) => _sendMessage(),
              decoration: InputDecoration(labelText: 'Enviar mensagem...'),
            ),
          ),
          IconButton(icon: Icon(Icons.send), onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage),
        ],
      ),
    );
  }
}
