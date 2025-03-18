import 'dart:async';
import 'package:chat/components/new_message.dart';
import 'package:chat/models/chat_message.dart';
import 'package:chat/models/chat_user.dart';
import 'package:chat/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
      id: '1',
      text: 'Morning',
      createdAt: DateTime.now(),
      userId: '123',
      userName: 'Pedro',
      userImageUrl: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '2',
      text: 'Hello',
      createdAt: DateTime.now(),
      userId: '234',
      userName: 'Thiago',
      userImageUrl: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '3',
      text: 'Great',
      createdAt: DateTime.now(),
      userId: '345',
      userName: 'João',
      userImageUrl: 'assets/images/avatar.png',
    ),
  ];

  static MultiStreamController<List<ChatMessage>>? _controller;

  static final _msgsSream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  Stream<List<ChatMessage>> messagesStream() {
    return _msgsSream;
  }

  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: DateTime.now().toString(),
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageUrl: user.imageUrl,
    );

    _msgs.add(newMessage);
    _controller?.add(_msgs);
    return newMessage;
  }
}
