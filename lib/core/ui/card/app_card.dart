import 'package:flutter/material.dart';
import 'card_style.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final AppCardStyle? style;
  final VoidCallback? onTap;

  const AppCard({
    super.key,
    required this.child,
    this.style,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final base = AppCardStyle(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.10),
          blurRadius: 20,
          offset: const Offset(0, 29),
        )
      ],
    );

    final s = base.merge(style);

    final card = Container(
      padding: s.padding,
      decoration: BoxDecoration(
        color: s.backgroundColor,
        borderRadius: BorderRadius.circular(s.radius),
        border: s.borderColor != null
            ? Border.all(color: s.borderColor!)
            : null,
        boxShadow: s.shadow,
      ),
      child: child,
    );

    if (onTap == null) return card;

    return InkWell(
      borderRadius: BorderRadius.circular(s.radius),
      onTap: onTap,
      child: card,
    );
  }
}
