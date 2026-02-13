import 'package:flutter/material.dart';
import 'router.dart';

class KanaApp extends StatelessWidget {
  const KanaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kana App',
      theme: ThemeData(useMaterial3: true),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: '/login',
    );
  }
}
