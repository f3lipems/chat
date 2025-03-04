import 'package:chat/components/auth_form.dart';
import 'package:chat/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLoading = false;

  void _onSubmit(AuthFormData formData) {
    setState(() => isLoading = true);

    print('Auth Page');
    print(formData.email);
    print(formData.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(children: [
        Center(child: SingleChildScrollView(child: AuthForm(onSubmit: _onSubmit))),
        if (isLoading) Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.5)
          ),
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        )
        ]
      ),
    );
  }
}
