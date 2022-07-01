import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_demo/rocket_details/rocket_details.dart';
import 'package:spacex_demo/rockets/cubit/rockets_cubit.dart';

/// Show the fetched rockets list based on the fetch status
class RocketList extends StatelessWidget {
  const RocketList({super.key});

  @override
  Widget build(BuildContext context) {
    final rockets =
        context.select((RocketsCubit cubit) => cubit.state.rockets!);

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
