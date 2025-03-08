import 'dart:io';

import 'package:chat/models/chat_user.dart';
import 'package:chat/services/auth/auth_service.dart';

class AuthServiceMock implements AuthService {
  @override
  ChatUser? get currentUser => null;

  @override
  Stream<ChatUser?> get userChanges => Stream.empty();

  @override
  Future<void> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Future<void> logout() async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Future<void> signup(String name, String email, String password, File image) async {
    await Future.delayed(Duration(seconds: 1));
  }
}