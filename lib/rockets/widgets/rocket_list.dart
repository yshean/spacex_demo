import 'package:flutter/material.dart';
import 'package:spacex_api/spacex_api.dart';
import 'package:spacex_demo/rocket_details/rocket_details.dart';

/// Show the fetched rockets list based on the fetch status
class RocketList extends StatelessWidget {
  const RocketList({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(you): Get the rockets from the RocketsCubit
    final rockets = [
      Rocket(
        id: '0',
        name: 'mock-rocket-name',
        description: 'mock-rocket-description',
        height: const Length(meters: 1, feet: 1),
        diameter: const Length(meters: 1, feet: 1),
        mass: const Mass(kg: 1, lb: 1),
        flickrImages: const ['https://example.com/'],
        active: true,
        firstFlight: DateTime(2021, 12, 31),
        wikipedia: 'https://wikipedia.com/',
      ),
    ];

    return ListView(
      children: [
        for (final rocket in rockets) ...[
          ListTile(
            isThreeLine: true,
            onTap: () {
              Navigator.of(context).push(
                RocketDetailsPage.route(rocket: rocket),
              );
            },
            title: Text(rocket.name),
            subtitle: Text(
              rocket.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.chevron_right_sharp),
          ),
          const Divider(),
        ],
      ],
    );
  }
}
