import 'package:flutter/material.dart';
import 'package:flutter_football/components/top_scorers_table.dart';
import 'package:flutter_football/models/top_scorers.dart';
import 'package:flutter_football/services/TopScorersService.dart';

import '../models/league.dart';

class TopScorersScreen extends StatefulWidget {
  final League league;
  final int season;

  const TopScorersScreen({
    Key? key,
    required this.league,
    required this.season,
  }) : super(key: key);

  @override
  State<TopScorersScreen> createState() => _TopScorersScreenState();
}

class _TopScorersScreenState extends State<TopScorersScreen> {
  TopScorersService topScorersService = TopScorersService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: topScorersService.fetchTopScorers(widget.league, widget.season),
        builder: (context, AsyncSnapshot<List<TopScorers>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return TopScorersTable(topScorers: snapshot.data ?? []);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
