import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../model/deck_stats.dart';

const deckStatsPage = [
  DeckStats(
    value: "3",
    describ: "Active Decks",
    icon: LucideIcons.bookOpen,
    // color: Colors.greenAccent,
  ),
  DeckStats(
    value: "0",
    describ: "Average Score",
    icon: LucideIcons.search,
    // color: Colors.blueAccent,
  ),
  DeckStats(
    value: "67%",
    describ: "Avg Completion",
    icon: LucideIcons.trendingUp,
    // color: Colors.greenAccent,
  ),
];
