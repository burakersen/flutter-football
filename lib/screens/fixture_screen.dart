import 'package:flutter/material.dart';
import 'package:flutter_football/components/fixture_list_view.dart';
import 'package:flutter_football/models/fixture.dart';
import 'package:flutter_football/services/FixtureService.dart';

import '../models/league.dart';

class FixtureScreen extends StatefulWidget {
  final League league;
  final int season;
  final String date;

  const FixtureScreen({
    Key? key,
    required this.league,
    required this.season,
    required this.date,
  }) : super(key: key);

  @override
  State<FixtureScreen> createState() => _FixtureScreenState();
}

class _FixtureScreenState extends State<FixtureScreen> {
  FixtureService fixtureService = FixtureService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: fixtureService.fetchFixture(widget.league, widget.season, widget.date),
        builder: (context, AsyncSnapshot<List<Fixture>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return FixtureListView(fixtures: snapshot.data ?? []);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
