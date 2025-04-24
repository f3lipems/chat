import 'package:chat/services/notification/chat_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ChatNotificationService>(context);
    final items = service.notifications;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Notificações'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: service.itemsCount,
          itemBuilder: (ctx, idx) => ListTile(
            title: Text(items[idx].title),
            subtitle: Text(items[idx].body),
            onTap: () {
              service.removeNotification(idx);
            },
          ),
        ),
      ),
    );
  }
}