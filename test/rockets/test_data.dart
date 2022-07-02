import 'package:spacex_api/spacex_api.dart';

final rockets = List.generate(
  3,
  (i) => Rocket(
    id: '$i',
    name: 'mock-rocket-name-$i',
    description: 'mock-rocket-description-$i',
    height: const Length(meters: 1, feet: 1),
    diameter: const Length(meters: 1, feet: 1),
    mass: const Mass(kg: 1, lb: 1),
  ),
);
