
import 'dart:io';

enum AuthMode { signup, login }

class AuthFormData {
  String name = '';
  String email = '';
  String password = '';
  File? image;  
  AuthMode authMode = AuthMode.login;

  bool get isLogin {
    return authMode == AuthMode.login;
  }

  bool get isSignup {
    return authMode == AuthMode.signup;
  }

  void toggleAuthMode() {
    if (authMode == AuthMode.login) {
      authMode = isLogin ? AuthMode.signup : AuthMode.login;
    }
  }
}