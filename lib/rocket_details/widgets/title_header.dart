import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:spacex_demo/l10n/l10n.dart';
import 'package:spacex_demo/rocket_details/cubit/rocket_details_cubit.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final rocket =
        context.select((RocketDetailsCubit cubit) => cubit.state.rocket);

    return ListTile(
      title: Row(
        children: [
          Text(
            rocket.name,
            style: Theme.of(context).textTheme.headline5,
          ),
          if (rocket.active != null) ...[
            const SizedBox(width: 4),
            if (rocket.active!)
              const Icon(
                Icons.check,
                color: Colors.green,
              )
            else
              const Icon(
                Icons.close,
                color: Colors.red,
              ),
          ],
        ],
      ),
      subtitle: rocket.firstFlight == null
          ? null
          : Text(
              l10n.rocketDetailsFirstFlightSubtitle(
                DateFormat('dd-MM-yyyy').format(rocket.firstFlight!),
              ),
            ),
    );
  }
}
