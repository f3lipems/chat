import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            CircularProgressIndicator(color: Theme.of(context).primaryTextTheme.headlineMedium?.color),
            Text('Loading...', style: TextStyle(color: Theme.of(context).primaryTextTheme.headlineMedium?.color, fontSize: 20))],
        ),
      ),
    );
  }
}
