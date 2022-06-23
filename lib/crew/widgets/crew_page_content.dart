import 'package:flutter/material.dart';
import 'package:spacex_demo/crew/crew.dart';
import 'package:spacex_demo/l10n/l10n.dart';

/// Show the fetched crew members list based on the fetch status
class CrewPageContent extends StatelessWidget {
  const CrewPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // TODO(yshean): get the status from the cubit state
    final status = CrewStatus.initial;

    switch (status) {
      case CrewStatus.initial:
        return const SizedBox(
          key: Key('crewView_initial_sizedBox'),
        );
      case CrewStatus.loading:
        return const Center(
          key: Key('crewView_loading_indicator'),
          child: CircularProgressIndicator.adaptive(),
        );
      case CrewStatus.failure:
        return Center(
          key: const Key('crewView_failure_text'),
          child: Text(l10n.crewFetchErrorMessage),
        );
      case CrewStatus.success:
        return const CrewMembersList(
          key: Key('crewView_success_crewMemberList'),
        );
    }
  }
}
