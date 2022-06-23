import 'package:flutter/material.dart';
import 'package:spacex_demo/crew/crew.dart';
import 'package:spacex_demo/l10n/l10n.dart';

class CrewPage extends StatelessWidget {
  const CrewPage({super.key});

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
