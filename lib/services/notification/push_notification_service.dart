import 'package:chat/models/chat_notification.dart';
import 'package:flutter/material.dart';

class PushNotificationService with ChangeNotifier {
  List<ChatNotification> _items = [];

  List<ChatNotification> get notifications {
    return [... _items];
  }

  void addNotification(ChatNotification notification) {
    _items.add(notification);
  } 

  void removeNotification(int idx) {
    _items.removeAt(idx);
  }
}