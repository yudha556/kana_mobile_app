import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  final Widget child;
  const CardHeader({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.titleMedium!,
        child: child,
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final Widget child;
  const CardContent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class CardFooter extends StatelessWidget {
  final Widget child;
  const CardFooter({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: child,
    );
  }
}
