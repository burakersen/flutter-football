import 'package:flutter/material.dart';
import 'package:flutter_football/components/standings_table.dart';
import 'package:flutter_football/models/league.dart';
import 'package:flutter_football/models/standings.dart';
import 'package:flutter_football/services/StandingsService.dart';

class StandingsScreen extends StatefulWidget {
  final League league;
  final int season;
  const StandingsScreen({
    Key? key,
    required this.league,
    required this.season,
  }) : super(key: key);

  @override
  State<StandingsScreen> createState() => _StandingsScreenState();
}

class _StandingsScreenState extends State<StandingsScreen> {
  StandingsService standingsService = StandingsService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: standingsService.fetchStandings(widget.league, widget.season),
        builder: (context, AsyncSnapshot<List<Standings>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return StandingsTable(standings: snapshot.data ?? []);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
