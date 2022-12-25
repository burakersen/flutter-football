import 'package:flutter/material.dart';
import 'package:flutter_football/models/top_scorers.dart';

class TopScorersTable extends StatelessWidget {
  final List<TopScorers> topScorers;

  const TopScorersTable({
    Key? key,
    required this.topScorers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Table(
          border: TableBorder.all(width: 1.0, color: Colors.black),
          children: [
            for (var scorers in topScorers) TableRow(children: [
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('${scorers.statistics?.team?.name}'),
                    Text('${scorers.player?.name}'),
                    Text('${scorers.player?.age}'),
                  ],
                ),
              ),
            ]),
          ],
      ),
    );
  }
}
