import 'package:flutter/material.dart';
import 'package:spacex_demo/l10n/l10n.dart';
import 'package:spacex_demo/rockets/cubit/rockets_cubit.dart';
import 'package:spacex_demo/rockets/widgets/widgets.dart';

/// Show the fetched rockets list based on the fetch status
class RocketsPageContent extends StatelessWidget {
  const RocketsPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // TODO(you): Get the status from the RocketsCubit
    const status = RocketsStatus.success;

    switch (status) {
      case RocketsStatus.initial:
        return const SizedBox(
          key: Key('rocketsView_initial_sizedBox'),
        );
      case RocketsStatus.loading:
        return const Center(
          key: Key('rocketsView_loading_indicator'),
          child: CircularProgressIndicator.adaptive(),
        );
      case RocketsStatus.failure:
        return Center(
          key: const Key('rocketsView_failure_text'),
          child: Text(l10n.rocketsFetchErrorMessage),
        );
      case RocketsStatus.success:
        return const RocketList(
          key: Key('rocketsView_success_rocketList'),
        );
    }
  }
}
