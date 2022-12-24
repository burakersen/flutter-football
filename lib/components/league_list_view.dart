import 'package:flutter/material.dart';
import 'package:flutter_football/components/league_card.dart';

import '../models/league.dart';

class LeagueListView extends StatelessWidget {
  final List<League> leagues;
  const LeagueListView({
    Key? key,
    required this.leagues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        primary: true,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: leagues.length,
        itemBuilder: (context, index) {
          final league = leagues[index];
          return LeagueCard(league: league);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
      ),
    );
  }
}
