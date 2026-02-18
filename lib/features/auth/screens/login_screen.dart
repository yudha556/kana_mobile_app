import 'package:flutter/material.dart';
import '../widgets/animated_bg.dart';
import '../widgets/login_card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Pakai resizeToAvoidBottomInset biar card-nya naik pas keyboard muncul
      resizeToAvoidBottomInset: true, 
      body: Stack(
        children: [
          const AnimatedBackground(),
          Center(
            child: Padding(
              // Ngasih jarak 24 pixel di kanan dan kiri
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: const LoginCard(),
            ),
          ),
        ],
      ),
    );
  }
}