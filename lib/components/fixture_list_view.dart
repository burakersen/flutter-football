import 'package:flutter/material.dart';

import '../models/fixture.dart';
import 'fixture_card.dart';

class FixtureListView extends StatelessWidget {
  final List<Fixture> fixtures;
  const FixtureListView({
    Key? key,
    required this.fixtures,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        primary: true,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: fixtures.length,
        itemBuilder: (context, index) {
          final fixture = fixtures[index];
          return FixtureCard(fixture: fixture);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
      ),
    );
  }
}
