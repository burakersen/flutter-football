import 'package:flutter/material.dart';
import 'package:flutter_football/components/league_list_view.dart';
import 'package:flutter_football/models/country.dart';
import 'package:flutter_football/models/league.dart';
import 'package:flutter_football/services/LeagueService.dart';

class LeagueScreen extends StatefulWidget {
  final Country? country;
  final int season;

  const LeagueScreen({
    Key? key,
    required this.country,
    required this.season,
  }) : super(key: key);

  @override
  State<LeagueScreen> createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  final LeagueService leagueService = LeagueService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Football',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: leagueService.fetchLeagues(widget.country!, widget.season),
          builder: (context, AsyncSnapshot<List<League>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return LeagueListView(leagues: snapshot.data ?? []);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
