import 'package:flutter/material.dart';
import 'package:flutter_football/components/league_card.dart';

import '../models/country.dart';
import '../models/league.dart';
import '../services/LeagueService.dart';

class LeagueListView extends StatefulWidget {
  final List<League> leagues;
  final int season;
  const LeagueListView({
    Key? key,
    required this.leagues,
    required this.season,
  }) : super(key: key);

  @override
  State<LeagueListView> createState() => _LeagueListViewState();
}

class _LeagueListViewState extends State<LeagueListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.separated(
            primary: true,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: widget.leagues.length,
            itemBuilder: (context, index) {
              final league = widget.leagues[index];
              return LeagueCard(league: league,season:widget.season);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
          ),
        );

  }

}



