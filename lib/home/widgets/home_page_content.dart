import 'package:flutter/material.dart';
import 'package:spacex_demo/home/home.dart';
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
                // TODO(yshean): onTap: () => Navigator.of(context).push(RocketsPage.route())
                onTap: () {},
                title: Text(l10n.rocketSpaceXTileTitle),
                imageUrl: 'lib/app_ui/assets/images/img_spacex_rocket.jpeg',
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
                // TODO(yshean): onTap needs to do () => Navigator.of(context).push(CrewPage.route())
                onTap: () {},
                title: Text(l10n.crewSpaceXTileTitle),
                imageUrl: 'lib/app_ui/assets/images/img_spacex_crew.jpeg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
