import 'dart:async';
import 'dart:io';

import 'package:chat/models/chat_user.dart';
import 'package:chat/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
  static final _defaultUser = ChatUser(
    id: '234',
    name: 'Tiago',
    email: 'tiago@visionar.io',
    imageUrl: 'assets/images/avatar.png',
  );

  static final Map<String, ChatUser> _users = {_defaultUser.email: _defaultUser};
  static ChatUser? _currentUser;
  static MultiStreamController<ChatUser?>? _controller;
  static final _userStream = Stream<ChatUser?>.multi((controller) {
    _controller = controller;
    _updateUser(_defaultUser);
  });

  @override
  ChatUser? get currentUser => _currentUser;

  @override
  Stream<ChatUser?> get userChanges {
    return _userStream;
  }

  @override
  Future<void> login(String email, String password) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  @override
  Future<void> signup(String name, String email, String password, File? image) async {
    final newUser = ChatUser(
      id: DateTime.now().toString(),
      name: name,
      email: email,
      imageUrl: image?.path ?? 'assets/images/avatar.png',
    );
    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  static void _updateUser(ChatUser? user) {
    _currentUser = user;
    _controller?.add(user);
  }
}
