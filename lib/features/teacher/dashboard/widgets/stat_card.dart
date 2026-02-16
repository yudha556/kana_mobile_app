import 'package:flutter/material.dart';
import 'package:kana_mobile_app/core/ui/card/app_card.dart';
import '../models/dashboard_stat.dart';

class StatCard extends StatelessWidget {
  final DashboardStat stat;
  const StatCard({super.key, required this.stat});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stat.title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Icon(stat.icon),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            stat.value,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(stat.description),
        ],
      ),
    );
  }
}
