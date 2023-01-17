import 'package:flutter/material.dart';

import '../models/fixture.dart';
import '../widgets/fixture_slice.dart';

class FixtureCard extends StatelessWidget {
  final Fixture fixture;
  const FixtureCard({
    Key? key,
    required this.fixture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.hardEdge,
          child: Container(
            width: _size.width,
            height: 230,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0XFFE1D7C6).withOpacity(0.8), Color(0XFFE1D7C6)])),
            child: Stack(
              children: <Widget>[
                FixtureSlice(),
                buildHomeTeam(_size),
                buildAwayTeam(_size),
                showScore(fixture.fixture!.status!.short)
                    ? buildScoreBoard(
                    fixture.goals?.home ?? 0, fixture.goals!.away ?? 0)
                    : buildStatusBar(_size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align buildStatusBar(Size _size) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: _size.width * 0.33,
        height: fixture.fixture!.status!.short == 'NS' ? 50 : 40,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FittedBox(
                child: Text(
                  fixture.fixture!.status!.long,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              if (fixture.fixture!.status!.short == 'NS')
                FittedBox(
                  child: Text(
                    '${fixture.fixture!.date!.substring(11, 16)} GMT',
                    style: TextStyle(fontSize: 16, color: Color(0XFF363432)),
                  ),
                )
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }

  bool requiresStatus(String status) {
    bool isRequired = false;
    if (status == 'ET' ||
        status == 'P' ||
        status == 'FT' ||
        status == 'AET' ||
        status == 'PEN') isRequired = true;
    return isRequired;
  }

  bool showScore(String status) {
    bool isOk = false;
    switch (status) {
      case '1H':
      case 'HT':
      case '2H':
      case 'ET':
      case 'P':
      case 'FT':
      case 'AET':
      case 'PEN':
      case 'BT':
      case 'SUSP':
        isOk = true;
        break;
    }
    return isOk;
  }

  Align buildScoreBoard(int homeScore, int awayScore) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 40,
        height: 150,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '${fixture.goals!.home}',
              style:
              TextStyle(color: Color(0XFF363432), fontWeight: FontWeight.bold),
            ),
            requiresStatus(fixture.fixture!.status!.short)
                ? Tooltip(
                message: fixture.fixture!.status!.long,
                child: Text(
                  fixture.fixture!.status!.short,
                  style: TextStyle(
                      color: Color(0XFF363432), fontWeight: FontWeight.bold),
                ))
                : Icon(Icons.more_vert),
            Text(
              '${fixture.goals!.away}',
              style:
              TextStyle(color: Color(0XFF363432), fontWeight: FontWeight.bold),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }

  Align buildHomeTeam(Size _size) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FittedBox(
              child: Text(
                fixture.teams!.home!.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fixture.teams!.home!.name.length > 15 ? 16 : 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            Image.network(fixture.teams!.home!.logo,
                width: _size.width * 0.25, fit: BoxFit.cover)
          ],
        ),
      ),
    );
  }

  Align buildAwayTeam(Size _size) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network(fixture.teams!.away!.logo,
                width: _size.width * 0.25, fit: BoxFit.cover),
            SizedBox(height: 10),
            FittedBox(
                child: Text(
                  fixture.teams!.away!.name,
                  style: TextStyle(
                      color: Color(0XFF363432),
                      fontSize: fixture.teams!.away!.name.length > 13 ? 16 : 22,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }


}
