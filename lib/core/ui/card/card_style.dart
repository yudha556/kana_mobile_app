import 'package:flutter/material.dart';

class AppCardStyle {
  final Color? backgroundColor;
  final Color? borderColor;
  final double radius;
  final EdgeInsets padding;
  final List<BoxShadow>? shadow;

  const AppCardStyle({
    this.backgroundColor,
    this.borderColor,
    this.radius = 16,
    this.padding = const EdgeInsets.all(16),
    this.shadow,
  });

  AppCardStyle merge(AppCardStyle? other) {
    if (other == null) return this;
    return AppCardStyle(
      backgroundColor: other.backgroundColor ?? backgroundColor,
      borderColor: other.borderColor ?? borderColor,
      radius: other.radius,
      padding: other.padding,
      shadow: other.shadow ?? shadow,
    );
  }
}
