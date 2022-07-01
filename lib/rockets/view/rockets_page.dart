import 'package:flutter/material.dart';
import 'package:spacex_demo/l10n/l10n.dart';
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
    // TODO(you): wrap this with BlocProvider that supplies RocketsCubit
    // remember to fetch your rockets too!
    return const RocketsView();
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
