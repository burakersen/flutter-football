import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/standings.dart';
import '/widgets/form_row.dart';

class StandingsTable extends StatefulWidget {
  final List<Standings> standings;

  const StandingsTable({
    Key? key,
    required this.standings,
  }) : super(key: key);

  @override
  State<StandingsTable> createState() => _StandingsTableState();
}

class _StandingsTableState extends State<StandingsTable> {


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

  Padding buildLeaderBoard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
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
                              '#1',
                              style: TextStyle(
                                  color: Color(0XFF363432),
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 8, 8),
                            child: Text(
                              "${widget.standings[0].team?.name}",
                              style: TextStyle(
                                  color: Color(0XFF363432),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 8, bottom: 15),
                            child: Text(
                              '${widget.standings[0].points} Points',
                              style: TextStyle(
                                  color: Color(0XFF363432),
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                  flex: 2,
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0.2, end: 1),
                    duration: Duration(milliseconds: 1200),
                    builder: (BuildContext context, double size, child) {
                      return Center(
                        child: Image.network(
                          widget.standings[0].team!.logo,
                          height: 200 * size,
                          width: MediaQuery.of(context).size.width * 0.8 ,
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DataTable buildDataTable() {
    return DataTable(
      columnSpacing: 20,
      columns: [
        DataColumn(label: Text('Pos'), tooltip: 'Team Position', numeric: true),
        DataColumn(label: Text('Club'), tooltip: 'Club 🐸'),
        DataColumn(label: Text('Pts'), tooltip: 'Points', numeric: true),
        DataColumn(
            label: Text('AV'), tooltip: 'Goals Difference', numeric: true),
        DataColumn(label: Text('P'), tooltip: 'matchs Played', numeric: true),
        DataColumn(
          label: Text(
            'W',
            style: TextStyle(color: Colors.green),
          ),
          tooltip: 'Won',
          numeric: true,
        ),
        DataColumn(
          label: Text(
            'L',
            style: TextStyle(color: Colors.redAccent),
          ),
          tooltip: 'Lost',
          numeric: true,
        ),
        DataColumn(
            label: Text(
              'D',
              style: TextStyle(color: Colors.blueAccent),
            ),
            tooltip: 'Drawn',
            numeric: true),
        DataColumn(label: Text('Form'), tooltip: 'Form'),
      ],
      rows: widget.standings.map((Standings standings) {
        return DataRow(cells: [
          DataCell(Text(
            '${standings.rank}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          )),
          DataCell(
            FittedBox(
              child: GestureDetector(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(standings.team!.logo),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(standings.team!.name),
                  ],
                ),
              ),
            ),
          ),
          DataCell(Text('${standings.points}')),
          DataCell(Text('${standings.goalsDiff}')),
          DataCell(Text('${standings.all!.played}')),
          DataCell(Text(
            '${standings.all!.win}',
            style: TextStyle(color: Colors.green),
          )),
          DataCell(Text(
            '${standings.all!.lose}',
            style: TextStyle(color: Colors.redAccent),
          )),
          DataCell(Text(
            '${standings.all!.draw}',
            style: TextStyle(color: Colors.blueAccent),
          )),
          DataCell(FormRow(standings.form)),
        ]);
      }).toList(),
    );
  }



}
