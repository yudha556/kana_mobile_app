import 'package:flutter/material.dart';
import '../model/dashboard_stat.dart';

class StatCard extends StatelessWidget {
  final DashboardStat stat;
  const StatCard({super.key, required this.stat});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: const Color.fromARGB(221, 255, 255, 255),
        borderRadius: BorderRadius.circular(24),
        border: const Border(
          left: BorderSide(color: Color(0xFF5BAFCB), width: 6),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: const Border(
                top: BorderSide(color: Color(0xFF5BAFCB)),
                bottom: BorderSide(color: Color(0xFF5BAFCB)),
                left: BorderSide(color: Color(0xFF5BAFCB)),
                right: BorderSide(color: Color(0xFF5BAFCB)),
              ),
            ),
            child: Text(
              stat.title,
              style: const TextStyle(
                color: Color(0xFF5BAFCB),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            stat.describ,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
