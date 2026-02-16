import 'package:lucide_icons/lucide_icons.dart';
import '../models/dashboard_stat.dart';

const teacherStats = [
  DashboardStat(
    title: "Total Material",
    value: "0",
    description: "PDF documents uploaded",
    icon: LucideIcons.fileText,
  ),
  DashboardStat(
    title: "Active Student",
    value: "0",
    description: "Students in your classes",
    icon: LucideIcons.users,
  ),
  DashboardStat(
    title: "Quiz Decks",
    value: "0",
    description: "Generated quiz decks",
    icon: LucideIcons.bookOpen,
  ),
  DashboardStat(
    title: "Completion Rate",
    value: "0",
    description: "Average student completion",
    icon: LucideIcons.barChart3,
  ),
];
