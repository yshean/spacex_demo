import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_demo/l10n/l10n.dart';
import 'package:spacex_demo/rockets/cubit/rockets_cubit.dart';
import 'package:spacex_demo/rockets/widgets/widgets.dart';

/// Show the fetched rockets list based on the fetch status
class RocketsPageContent extends StatelessWidget {
  const RocketsPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final status = context.select((RocketsCubit cubit) => cubit.state.status);

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
