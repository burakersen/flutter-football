import 'package:flutter/material.dart';
import 'package:flutter_football/screens/fixture_screen.dart';
import 'package:flutter_football/screens/standings_screen.dart';
import 'package:flutter_football/screens/top_scorers_screen.dart';
import 'package:jiffy/jiffy.dart';

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
  String date ="";

  List<Widget>? pages;

  @override
  void initState() {
    super.initState();

    pages = <Widget>[
      StandingsScreen(league: widget.league, season: widget.season),
      TopScorersScreen(league: widget.league, season: widget.season),
      FixtureScreen(league: widget.league, season: widget.season, date: date, onDateChange: _onDateChange),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.league;
  }

  void _onDateChange(DateTime changedDate){
    setState(() {
      date = Jiffy(changedDate).format("yyyy-MM-dd");
      pages = <Widget>[
        StandingsScreen(league: widget.league, season: widget.season),
        TopScorersScreen(league: widget.league, season: widget.season),
        FixtureScreen(league: widget.league, season: widget.season, date: date, onDateChange: _onDateChange),
      ];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF567189),
        title: Text(
          '${widget.league.name} ${widget.season} - ${widget.season + 1} ',
          style: TextStyle(fontSize: 20,color: Colors.white),
        ),
      ),
      body: pages?[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Color(0XFF567189),
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
            label: 'Fixture',
          ),
        ],
      ),
    );
  }
}
