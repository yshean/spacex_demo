import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:rocket_repository/rocket_repository.dart';
import 'package:spacex_demo/rockets/rockets.dart';

import '../../helpers/helpers.dart';
import '../test_data.dart';

void main() {
  group('RocketsPage', () {
    late RocketRepository rocketRepository;

    setUp(() {
      rocketRepository = MockRocketRepository();
      when(
        () => rocketRepository.fetchAllRockets(),
      ).thenAnswer((_) async => rockets);
    });

    test('has route', () {
      expect(
        RocketsPage.route(),
        isA<MaterialPageRoute<void>>(),
      );
    });

    testWidgets('renders RocketsPage when calling route', (tester) async {
      await tester.pumpApp(
        Navigator(
          onGenerateRoute: (_) => RocketsPage.route(),
        ),
        rocketRepository: rocketRepository,
      );

      expect(find.byType(RocketsPage), findsOneWidget);
    });

    testWidgets('renders RocketsView', (tester) async {
      await tester.pumpApp(
        const RocketsPage(),
        rocketRepository: rocketRepository,
      );

      expect(find.byType(RocketsView), findsOneWidget);
    });
  });
}
