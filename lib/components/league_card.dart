import 'package:flutter/material.dart';
import 'package:flutter_football/screens/league_details_screen.dart';
import 'package:flutter_football/screens/standings_screen.dart';

import '../models/league.dart';

class LeagueCard extends StatelessWidget {
  final League league;
  final int season;
  const LeagueCard({
    Key? key,
    required this.league,
    required this.season,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LeagueDetailsScreen(league: league, season: season)),
        ),
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: Card(
              color: Color(0XFFE1D7C6),
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10, height: 100),
                  Image.network('${league.logo}', width: 60, height: 60),
                  const SizedBox(width: 30),
                  Flexible(
                    child: Text(
                    '${league.name}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        color: Color(0XFF363432),
                    ),
                  ),),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
