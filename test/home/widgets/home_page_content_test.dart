import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:spacex_demo/crew/crew.dart';
import 'package:spacex_demo/home/widgets/widgets.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('HomePageContent', () {
    late MockNavigator navigator;

    setUp(() {
      navigator = MockNavigator();

      when(() => navigator.push<void>(any(that: isRoute<void>())))
          .thenAnswer((_) async {});
    });

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

    testWidgets(
      'navigates to CrewPage '
      'when crew category card is tapped',
      (tester) async {
        await tester.pumpApp(
          const HomePageContent(),
          navigator: navigator,
        );

        await tester.tap(
          find.byKey(
            const Key('homePageContent_crew_spaceXCategoryCard'),
          ),
        );

        verify(
          () => navigator.push<void>(
            any(that: isRoute<void>(whereName: equals(CrewPage.routeName))),
          ),
        ).called(1);
      },
    );

    // TODO(yshean): test navigation to RocketsPage
  });
}
