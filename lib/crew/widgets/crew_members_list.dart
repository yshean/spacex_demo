import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_demo/crew/cubit/crew_cubit.dart';
import 'package:spacex_demo/crew_member_details/crew_member_details.dart';

class CrewMembersList extends StatelessWidget {
  const CrewMembersList({super.key});

  @override
  Widget build(BuildContext context) {
    final crewMembers =
        context.select((CrewCubit cubit) => cubit.state.crewMembers!);

    return ListView(
      children: [
        for (final crewMember in crewMembers) ...[
          ListTile(
            isThreeLine: true,
            onTap: () {
              Navigator.of(context).push<void>(
                CrewMemberDetailsPage.route(crewMember: crewMember),
              );
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(crewMember.image),
            ),
            title: Text(crewMember.name),
            subtitle: Text(
              crewMember.agency,
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
