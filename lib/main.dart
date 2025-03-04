import 'package:chat/pages/auth_page.dart';
import 'package:chat/utils/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Chat App', 
      theme: AppTheme.theme(), 
      home: AuthPage(),
    );
  }
}
