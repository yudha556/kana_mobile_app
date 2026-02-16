import 'package:flutter/material.dart';
import 'router.dart';

class KanaApp extends StatelessWidget {
  const KanaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final base = ThemeData(useMaterial3: true);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Kana App',
      routerConfig: AppRouter.router,

      theme: base.copyWith(
        scaffoldBackgroundColor: Colors.white,

        colorScheme: base.colorScheme.copyWith(
          background: Colors.white,
          surface: Colors.white,
          surfaceContainer: Colors.white,
          surfaceContainerHighest: Colors.white,
        ),

        cardTheme: const CardThemeData(
          color: Colors.white,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
        ),

        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
        ),

        dialogTheme: const DialogThemeData(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
