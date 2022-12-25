import 'package:flutter/material.dart';
import 'package:flutter_football/screens/fixture_screen.dart';
import 'package:flutter_football/screens/standings_screen.dart';
import 'package:flutter_football/screens/top_scorers_screen.dart';

import '../models/league.dart';

class LeagueDetailsScreen extends StatefulWidget {
  final League league;
  final int season;

  const LeagueDetailsScreen({
    Key? key,
    required this.league,
    required this.season,
  }) : super(key: key);

  @override
  State<LeagueDetailsScreen> createState() => _LeagueDetailsScreenState();
}

class _LeagueDetailsScreenState extends State<LeagueDetailsScreen> {
  int _selectedIndex = 0;

  List<Widget>? pages;

  @override
  void initState() {
    super.initState();
    /*var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);*/

   /* DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    print(date);*/

    pages = <Widget>[
      StandingsScreen(league: widget.league, season: widget.season),
      TopScorersScreen(league: widget.league, season: widget.season),
      FixtureScreen(league: widget.league, season: widget.season, date: '2022-11-12',),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.league;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Football${widget.season}',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: pages?[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.grey,
        onTap: _onItemTapped,
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label:"Ranking",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Top Scorers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections_bookmark),
            label: 'Table',
          ),
        ],
      ),
    );
  }
}
