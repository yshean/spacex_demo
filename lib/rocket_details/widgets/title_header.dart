import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spacex_api/spacex_api.dart';
import 'package:spacex_demo/l10n/l10n.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    // TODO(you): Get the rocket from RocketDetailsCubit
    final rocket = Rocket(
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
    );

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
