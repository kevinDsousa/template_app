import 'package:diamond_blank_app/app/presenter/auth/recovery_password/recovery_password_controller.dart';
import 'package:flutter/material.dart';

class RecoveryPasswordPage extends StatelessWidget {
  final RecoveryPasswordController controller;

  const RecoveryPasswordPage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return const Scaffold(
          body: Center(
            child: Text('Recovery Password Page'),
          ),
        );
      },
    );
  }
}
