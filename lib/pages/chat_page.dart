import 'package:chat/components/messages.dart';
import 'package:chat/components/new_message.dart';
import 'package:chat/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visionar Chat'),
        actions: [
          DropdownButton(
            icon: Icon(Icons.more_vert, color: Theme.of(context).primaryColor),
            onChanged: (value) {
              if (value == 'logout') {
                AuthService().logout();
              }
            },
            items: [
              DropdownMenuItem(
                value: 'logout',
                child: Row(
                  spacing: 10,
                  children: [Icon(Icons.exit_to_app, color: Colors.black), Text('Logout')],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(child: Column(children: [Expanded(child: Messages()), NewMessage()])),
    );
  }
}
