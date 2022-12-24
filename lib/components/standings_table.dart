import 'package:flutter/material.dart';

import '../models/standings.dart';

class StandingsTable extends StatelessWidget {
  final List<Standings> standings;

  const StandingsTable({
    Key? key,
    required this.standings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Table(
        border: TableBorder.all(width: 1.0, color: Colors.black),
          children: [
            for (var standing in standings) TableRow(children: [
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('${standing.team?.name}'),
                    Text('${standing?.points}'),
                  ],
                ),
              )
            ])
          ]
      ),
    );
  }
}
