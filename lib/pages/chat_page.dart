import 'package:chat/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Chat Page'),
            ElevatedButton(
              onPressed: () => AuthService().logout(),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}