import 'package:flutter/material.dart';

class AppNavigator {
  static Future push(BuildContext context, String route) {
    return Navigator.pushNamed(context, route);
  }

  static Future replace(BuildContext context, String route) {
    return Navigator.pushReplacementNamed(context, route);
  }

  static Future clearStack(BuildContext context, String route) {
    return Navigator.pushNamedAndRemoveUntil(context, route, (_) => false);
  }
}
