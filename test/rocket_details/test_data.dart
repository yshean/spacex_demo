import 'package:spacex_api/spacex_api.dart';

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
