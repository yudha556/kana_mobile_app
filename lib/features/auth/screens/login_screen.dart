import 'package:flutter/material.dart';
import '../widgets/animated_bg.dart';
import '../widgets/login_card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          AnimatedBackground(),
          Center(child: LoginCard()),
        ],
      ),
    );
  }
}
