import 'dart:math';

import 'package:chat/components/messages.dart';
import 'package:chat/components/new_message.dart';
import 'package:chat/models/chat_notification.dart';
import 'package:chat/pages/notification_page.dart';
import 'package:chat/services/auth/auth_service.dart';
import 'package:chat/services/notification/chat_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visionar Chat'),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryColor,
              ),
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
                    children: [
                      Icon(Icons.exit_to_app, color: Colors.black),
                      Text('Logout'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NotificationPage(),
                    ),
                  );
                },
              ),
              Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  maxRadius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                    '${Provider.of<ChatNotificationService>(context).itemsCount}',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(children: [Expanded(child: Messages()), NewMessage()]),
      ),
      // floatingActionButton: FloatingActionButton(
      //   // backgroundColor: Theme.of(context).actionIconTheme,
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Provider.of<ChatNotificationService>(
      //       context,
      //       listen: false,
      //     ).addNotification(
      //       ChatNotification(
      //         title: 'New Message',
      //         body: Random().nextInt(1000000).toString(),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
