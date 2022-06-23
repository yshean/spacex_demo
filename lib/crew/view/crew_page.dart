import 'package:crew_member_repository/crew_member_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_demo/crew/cubit/crew_cubit.dart';
import 'package:spacex_demo/crew/widgets/widgets.dart';
import 'package:spacex_demo/l10n/l10n.dart';

class CrewPage extends StatelessWidget {
  const CrewPage({super.key});

  static String get routeName => '/crews';

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const CrewPage(),
      settings: RouteSettings(name: CrewPage.routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CrewCubit(context.read<CrewMemberRepository>())
        ..fetchAllCrewMembers(),
      child: const CrewPageView(),
    );
  }
}

class CrewPageView extends StatelessWidget {
  const CrewPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.crewAppBarTitle),
      ),
      body: const Center(
        child: CrewPageContent(),
      ),
    );
  }
}
