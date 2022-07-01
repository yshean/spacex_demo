import 'package:flutter/material.dart';
import 'package:spacex_api/spacex_api.dart';

/// Show the fetched rockets list based on the fetch status
class RocketList extends StatelessWidget {
  const RocketList({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(you): Get the rockets from the RocketsCubit
    final rockets = <Rocket>[];

    return ListView(
      children: [
        for (final rocket in rockets) ...[
          ListTile(
            isThreeLine: true,
            // TODO(you): add navigation to RocketDetailsPage
            // onTap: () {
            //   Navigator.of(context).push(
            //     RocketDetailsPage.route(rocket: rocket),
            //   );
            // },
            onTap: () {},
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
