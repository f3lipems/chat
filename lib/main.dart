import 'package:chat/pages/auth_or_app_page.dart';
import 'package:chat/services/notification/push_notification_service.dart';
import 'package:chat/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PushNotificationService()),
        // ChangeNotifierProvider(create: (context) => ChatService()),
        // ChangeNotifierProvider(create: (context) => UserService()),
        // ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, 
        title: 'Chat App', 
        theme: AppTheme.theme(), 
        home: AuthOrAppPage(),
      ),
    );
  }
}
