import 'package:flutter/material.dart';
import 'package:flutter_football/models/country.dart';
import 'package:flutter_football/screens/league_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryCard extends StatelessWidget {
  final Country country;

  const CountryCard({
    Key? key,
    required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LeagueScreen(country: country, season: 2022)),
        ),
      },
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
                  const SizedBox(width: 10, height: 100,),
                  SvgPicture.network('${country.flag}', width: 60, height: 60,),
                  const SizedBox(width: 30),
                  Text(
                    '${country.name}',
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
