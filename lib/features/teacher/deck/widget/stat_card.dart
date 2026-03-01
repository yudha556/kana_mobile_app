import 'package:flutter/material.dart';
import '../../../../core/ui/card/app_card.dart';
import '../model/deck_stats.dart';

class StatCard extends StatelessWidget {
  final DeckStats stat;
  const StatCard({super.key, required this.stat});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(stat.icon, size: 40,),
          SizedBox(width: 14),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stat.value,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2),
              Text(
                stat.describ,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
