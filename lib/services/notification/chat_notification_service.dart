import 'package:chat/models/chat_notification.dart';
import 'package:flutter/material.dart';

class ChatNotificationService with ChangeNotifier {
  final List<ChatNotification> _items = [];

  List<ChatNotification> get notifications {
    return [... _items];
  }

  void addNotification(ChatNotification notification) {
    _items.add(notification);
    notifyListeners();
  } 

  int get itemsCount {
    return _items.length;
  }

  void removeNotification(int idx) {
    _items.removeAt(idx);
    notifyListeners();
  }
}