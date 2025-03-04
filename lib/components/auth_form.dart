import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          child: Column(
            children: [
              TextFormField(decoration: const InputDecoration(labelText: 'Nome')),
              TextFormField(decoration: const InputDecoration(labelText: 'Email'), keyboardType: TextInputType.emailAddress),
              TextFormField(decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: () {}, child: const Text('Entrar')),
              const SizedBox(height: 12),
              TextButton(onPressed: () {}, child: const Text('Criar nova conta')),
            ],
          ),
        ),
      ),
    );
  }
}
