import 'package:flutter/material.dart';
import 'package:flutter_football/components/fixture_list_view.dart';
import 'package:flutter_football/models/fixture.dart';
import 'package:flutter_football/services/FixtureService.dart';
import 'package:jiffy/jiffy.dart';

import '../models/league.dart';

class FixtureScreen extends StatefulWidget {
  final League league;
  final int season;
  final String date;
  final onDateChange;

  const FixtureScreen({
    Key? key,
    required this.league,
    required this.season,
    required this.date,
    required this.onDateChange,
  }) : super(key: key);

  @override
  State<FixtureScreen> createState() => _FixtureScreenState();
}

class _FixtureScreenState extends State<FixtureScreen> {
  FixtureService fixtureService = FixtureService();
  TextEditingController dateController = TextEditingController();

  @override
  void initState(){
    super.initState();
    dateController.text = widget.date;
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        TextField(
          controller: TextEditingController(text: widget.date),
          decoration: const InputDecoration(
            icon: Icon(Icons.calendar_today),
            labelText: 'Enter Match Day',
          ),
          readOnly: true,
          onTap: () async{
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: widget.date!="" ? Jiffy(widget.date).dateTime : Jiffy([widget.season, 08, 01]).dateTime,
                firstDate: DateTime(widget.season),
                lastDate: DateTime(widget.season + 2)).then((pickedDate) {widget.onDateChange(pickedDate);});

          },
        ),

        FutureBuilder(
          future: fixtureService.fetchFixture(widget.league, widget.season, widget.date),
          builder: (context, AsyncSnapshot<List<Fixture>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return FixtureListView(fixtures: snapshot.data ?? []);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],

    );
  }
}
