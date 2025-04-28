import 'dart:async';
import 'dart:io';

import 'package:chat/models/chat_user.dart';
import 'package:chat/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseService implements AuthService {
  static ChatUser? _currentUser;

  static final _userStream = Stream<ChatUser?>.multi((controller) async {
    final authChange = FirebaseAuth.instance.authStateChanges();
    await for (final user in authChange) {
      if (user == null) {
        _currentUser = null;
        controller.add(null);
      } else {
        _currentUser = _toChatUser(user);
        controller.add(_currentUser);
      }
    }
  });

  @override
  ChatUser? get currentUser => _currentUser;

  @override
  Stream<ChatUser?> get userChanges {
    return _userStream;
  }

  @override
  Future<void> login(String email, String password) async {}

  @override
  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signup(String name, String email, String password, File? image) async {
    final UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    if (userCredential.user == null) {
      throw Exception('User creation failed');
    }
    userCredential.user!.updateDisplayName(name);
    // userCredential.user!.updatePhotoURL();
  }

  static ChatUser _toChatUser(User user) {
    return ChatUser(
      id: user.uid,
      name: user.displayName ?? user.email!.split('@')[0],
      email: user.email!,
      imageUrl: user.photoURL ?? 'assets/images/avatar.png',
    );
  }
}
