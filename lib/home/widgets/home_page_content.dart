import 'package:flutter/material.dart';
import 'package:spacex_demo/crew/crew.dart';
import 'package:spacex_demo/home/widgets/widgets.dart';
import 'package:spacex_demo/l10n/l10n.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: SpaceXCategoryCard(
                key: const Key('homePageContent_rocket_spaceXCategoryCard'),
                // TODO(you): add navigation to RocketsPage
                // onTap: () => Navigator.of(context).push(RocketsPage.route())
                onTap: () {},
                title: Text(l10n.rocketSpaceXTileTitle),
                assetImage: const AssetImage(
                  'assets/images/img_spacex_rocket.jpeg',
                  package: 'spacex_ui',
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: SpaceXCategoryCard(
                key: const Key('homePageContent_crew_spaceXCategoryCard'),
                onTap: () => Navigator.of(context).push<void>(CrewPage.route()),
                title: Text(l10n.crewSpaceXTileTitle),
                assetImage: const AssetImage(
                  'assets/images/img_spacex_crew.jpeg',
                  package: 'spacex_ui',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
