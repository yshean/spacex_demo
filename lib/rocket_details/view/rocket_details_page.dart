import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_api/spacex_api.dart';
import 'package:spacex_demo/rocket_details/cubit/rocket_details_cubit.dart';
import 'package:spacex_demo/rocket_details/widgets/widgets.dart';

class RocketDetailsPage extends StatelessWidget {
  const RocketDetailsPage({super.key});

  static String routeName({required Rocket rocket}) => '/rocket/${rocket.id}';

  static Route<void> route({required Rocket rocket}) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => RocketDetailsCubit(rocket: rocket),
        child: const RocketDetailsPage(),
      ),
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
    final rocket =
        context.select((RocketDetailsCubit cubit) => cubit.state.rocket);

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
