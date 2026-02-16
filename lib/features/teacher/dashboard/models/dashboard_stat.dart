import 'package:flutter/material.dart';

class DashboardStat {
  final String title;
  final String value;
  final String description;
  final IconData icon;

  const DashboardStat({
    required this.title,
    required this.value,
    required this.description,
    required this.icon,
  });
}
