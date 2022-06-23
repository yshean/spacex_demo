import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_demo/home/widgets/home_page_content.dart';
import 'package:spacex_demo/home/widgets/spacex_category_card.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('HomePageContent', () {
    testWidgets(
      'renders correct amount of ' 'SpaceXCategoryCards',
      (tester) async {
        await tester.pumpApp(const HomePageContent());
        expect(find.byType(SpaceXCategoryCard), findsNWidgets(2));
      },
    );

    testWidgets(
      'renders a category card for rockets',
      (tester) async {
        await tester.pumpApp(const HomePageContent());
        expect(
          find.byKey(const Key('homePageContent_rocket_spaceXCategoryCard')),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'renders a category card for crews',
      (tester) async {
        await tester.pumpApp(const HomePageContent());
        expect(
          find.byKey(const Key('homePageContent_crew_spaceXCategoryCard')),
          findsOneWidget,
        );
      },
    );

    // TODO(yshean): test navigations
  });
}
