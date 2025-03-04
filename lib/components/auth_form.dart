import 'package:chat/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // _formKey.currentState!.save();
      // print(_formData.name);
      // print(_formData.email);
      // print(_formData.password);
    }
  }

  void _changeAuthMode() {
    setState(() {
      _formData.toggleAuthMode();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_formData.isSignup) 
                TextFormField(
                  key: ValueKey('name'), 
                  onChanged: (value) => _formData.name = value,
                  initialValue: _formData.name, 
                  decoration: 
                  const InputDecoration(labelText: 'Nome'),
                ),
              TextFormField(
                key: ValueKey('email'), 
                onChanged: (value) => _formData.email = value,
                decoration: const InputDecoration(labelText: 'Email'), 
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                key: ValueKey('password'), 
                onChanged: (value) => _formData.password = value,
                decoration: const InputDecoration(labelText: 'Password'), 
                obscureText: true,
              ),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: _submit, child: Text(_formData.isLogin ? 'Entrar' : 'Cadastrar')),
              const SizedBox(height: 12),
              TextButton(onPressed: _changeAuthMode, child: Text(_formData.isLogin ? 'Criar nova conta' : 'Fazer login')),
            ],
          ),
        ),
      ),
    );
  }
}
