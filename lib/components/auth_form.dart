import 'package:chat/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;

  const AuthForm({super.key, required this.onSubmit});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    _formKey.currentState!.save();
    widget.onSubmit(_formData);
  }

  void _changeAuthMode() {
    setState(() {
      _formData.toggleAuthMode();
    });
  }

  String? _nameValidator(String? value) {
    final name = value ?? '';
    if (name.trim().length < 3) return 'Nome deve ter pelo menos 3 caracteres';
    return null;
  }
  
  String? _emailValidator(String? value) {
    final email = value ?? '';
    if (!email.contains('@')) return 'E-mail inválido';
    return null;
  }

    String? _passwordValidator(String? value) {
    final password = value ?? '';
    if (password.trim().length < 6) return 'Senha deve ter pelo menos 6 caracteres';
    return null;
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
                  validator: _nameValidator,
                ),
              TextFormField(
                key: ValueKey('email'), 
                onChanged: (value) => _formData.email = value,
                decoration: const InputDecoration(labelText: 'Email'), 
                keyboardType: TextInputType.emailAddress,
                validator: _emailValidator,
              ),
              TextFormField(
                key: ValueKey('password'), 
                onChanged: (value) => _formData.password = value,
                decoration: const InputDecoration(labelText: 'Password'), 
                obscureText: true,
                validator: _passwordValidator,
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
