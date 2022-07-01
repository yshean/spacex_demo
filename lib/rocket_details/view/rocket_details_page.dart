import 'package:flutter/material.dart';
import 'package:spacex_api/spacex_api.dart';
import 'package:spacex_demo/rocket_details/widgets/widgets.dart';

class RocketDetailsPage extends StatelessWidget {
  const RocketDetailsPage({super.key});

  static String routeName({required Rocket rocket}) => '/rockets/${rocket.id}';

  static Route<void> route({required Rocket rocket}) {
    return MaterialPageRoute(
      // TODO(you): wrap this with BlocProvider that supplies RocketDetailsCubit
      // RocketDetailsCubit should have a Rocket object as an argument
      builder: (context) => const RocketDetailsPage(),
      settings: RouteSettings(
        name: RocketDetailsPage.routeName(rocket: rocket),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const RocketDetailsView();
  }
}

class RocketDetailsView extends StatelessWidget {
  const RocketDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(
        title: Text(rocket.name),
      ),
      body: const Center(
        child: RocketDetailsPageContent(),
      ),
    );
  }
}
