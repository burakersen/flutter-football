import 'package:flutter/material.dart';

import '../models/fixture.dart';

class FixtureCard extends StatelessWidget {
  final Fixture fixture;
  const FixtureCard({
    Key? key,
    required this.fixture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: Card(
              color: Colors.red,
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
                  //Image.network('${fixture.logo}', width: 60, height: 60),
                  const SizedBox(width: 30),
                  Text(
                    '${fixture.teams?.home?.id}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
