import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(you): Get the rocket description from RocketDetailsCubit
    // tips: get the rocket.description from the Rocket object
    const description = 'mock-rocket-description';

    return const Text(description);
  }
}
