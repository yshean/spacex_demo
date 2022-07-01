import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rocket_repository/rocket_repository.dart';
import 'package:spacex_demo/l10n/l10n.dart';
import 'package:spacex_demo/rockets/cubit/rockets_cubit.dart';
import 'package:spacex_demo/rockets/widgets/widgets.dart';

class RocketsPage extends StatelessWidget {
  const RocketsPage({super.key});

  static String get routeName => '/rockets';

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const RocketsPage(),
      settings: RouteSettings(name: RocketsPage.routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RocketsCubit(rocketRepository: context.read<RocketRepository>())
            ..fetchAllRockets(),
      child: const RocketsView(),
    );
  }
}

class RocketsView extends StatelessWidget {
  const RocketsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.rocketsAppBarTitle),
      ),
      body: const Center(
        child: RocketsPageContent(),
      ),
    );
  }
}
