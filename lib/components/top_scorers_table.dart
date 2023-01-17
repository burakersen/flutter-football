import 'package:flutter/material.dart';
import 'package:flutter_football/models/top_scorers.dart';

class TopScorersTable extends StatefulWidget {
  final List<TopScorers> topScorers;

  const TopScorersTable({
    Key? key,
    required this.topScorers,
  }) : super(key: key);

  @override
  State<TopScorersTable> createState() => _TopScorersTableState();
}

class _TopScorersTableState extends State<TopScorersTable> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              buildLeaderBoard(context),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: buildDataTable(),
              ),
            ],
          ),
        );

  }

  Padding buildLeaderBoard(BuildContext context, {double size = 1}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 15,
        borderRadius: BorderRadius.circular(10),
        color: Color(0XFFE1D7C6),
        clipBehavior: Clip.hardEdge,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            '${widget.topScorers[0].statistics?.goals?.total} Goals',
                            style: TextStyle(
                                color: Color(0XFF363432),
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(25, 0, 8, 8),
                            child: Text(
                              widget.topScorers[0].player!.name,
                              style: TextStyle(
                                  color: Color(0XFF363432),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 8, bottom: 8),
                          child: Text(
                            widget.topScorers[0].statistics!.team!.name,
                            style: TextStyle(color: Color(0XFF363432), fontSize: 18,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Center(
                  child: Image.network(
                    widget.topScorers[0].player!.photo,
                    height: 150 * size,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DataTable buildDataTable() {
    var rank = 0;
    return DataTable(
      columnSpacing: 20,
      columns: [
        DataColumn(label: Text('Rank'), tooltip: 'Player Rank', numeric: true),
        DataColumn(label: Text('Name'), tooltip: 'Name'),
        DataColumn(label: Text('Team'), tooltip: 'Team'),
        DataColumn(label: Text('Pos'), tooltip: 'Player Position'),
        DataColumn(label: Text('Matchs'), tooltip: 'Player Apperance'),
        DataColumn(label: Text('Minutes'), tooltip: 'Minutes played'),
        DataColumn(label: Text('Goals'), tooltip: 'Player Goals'),
        DataColumn(label: Text('Assits'), tooltip: 'Player Assists'),
        DataColumn(label: Text('YC'), tooltip: 'Yellow Card'),
        DataColumn(label: Text('SYC'), tooltip: 'Second Yellow Card'),
        DataColumn(label: Text('RC'), tooltip: 'Red Card'),
        DataColumn(label: Text('Country'), tooltip: 'Country'),
      ],
      rows: widget.topScorers.map((TopScorers scorer) {
        rank++;
        return DataRow(
          cells: [
            DataCell(Text(
              '$rank',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            )),
            DataCell(Text(scorer.player!.name)),
            DataCell(FittedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            scorer.statistics!.team.logo),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(scorer.statistics!.team.name),
                ],
              ),
            )),
            DataCell(Text('${scorer.statistics!.games!.position}')),
            DataCell(Text('${scorer.statistics!.games!.appearences ?? 0}')),
            DataCell(Text('${scorer.statistics!.games!.minutes ?? 0}')),
            DataCell(Text('${scorer.statistics!.goals!.total ?? 0}')),
            DataCell(Text('${scorer.statistics!.goals!.assists ?? 0}')),
            DataCell(buildCard(scorer.statistics!.cards!.yellow ?? 0, Colors.yellow)),
            DataCell(buildCard(scorer.statistics!.cards!.yellowred ?? 0, Colors.yellow)),
            DataCell(buildCard(scorer.statistics!.cards!.red ?? 0, Colors.red)),
            DataCell(Text(scorer.player!.nationality)),
          ],
        );
      }).toList(),
    );
  }

  Widget buildCard(int value, Color color) {
    return Container(
      width: 40,
      height: 35,
      padding: EdgeInsets.all(4),
      child: Center(
          child: Text(
            '$value',
            style: TextStyle(color: Colors.white),
          )),
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
    );
  }


}
