import 'package:diamond_blank_app/app/presenter/auth/login/login_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller;

  const LoginPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return Scaffold(
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Login Page'),
                ElevatedButton(
                  onPressed: controller.loginWithGoogle,
                  child: const Text('Login com Google'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
