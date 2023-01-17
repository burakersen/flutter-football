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
  late int newSeason;
  initState(){
    newSeason = widget.season;
  }
  changeSeason(type) {
    setState(() {
      if(type){
        newSeason++;
      }else{
        newSeason--;
      }
    });
  }

  final LeagueService leagueService = LeagueService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF567189),
        title: Text(
          '${widget.country?.name} Leagues',
          style: TextStyle(fontSize: 20,color: Colors.white),
        ),
      ),
      body: ListView(
        primary: true,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
        Material(
        color: Colors.white,
        elevation: 10,
        borderRadius: BorderRadius.circular(25),
        clipBehavior: Clip.hardEdge,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    setState(() {
                      changeSeason(false);
                    });
                  },
                  icon: Icon(
                    Icons.remove,
                  )),
              Column(
                children: <Widget>[
                  FittedBox(
                    child: Text(
                      'season',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      '$newSeason',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      changeSeason(true);
                    });
                  },
                  icon: Icon(
                    Icons.add,
                  )),
            ],
          ),
        ),
      ),
          FutureBuilder(
            future: leagueService.fetchLeagues(widget.country!, newSeason),
            builder: (context, AsyncSnapshot<List<League>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return LeagueListView(leagues: snapshot.data ?? [],season:newSeason);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
      ],
      ),
    );
  }
}
