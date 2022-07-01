import 'package:crew_member_repository/crew_member_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:spacex_demo/crew/crew.dart';

import '../../helpers/helpers.dart';
import '../test_data.dart';

void main() {
  group('CrewPage', () {
    late CrewMemberRepository crewMemberRepository;

    setUp(() {
      crewMemberRepository = MockCrewMemberRepository();
      when(
        () => crewMemberRepository.fetchAllCrewMembers(),
      ).thenAnswer((_) async => crewMembers);
    });

    test('has route', () {
      expect(
        CrewPage.route(),
        isA<MaterialPageRoute<void>>(),
      );
    });

    testWidgets('renders CrewPage when calling route', (tester) async {
      await tester.pumpApp(
        Navigator(
          onGenerateRoute: (_) => CrewPage.route(),
        ),
        crewMemberRepository: crewMemberRepository,
      );

      expect(find.byType(CrewPage), findsOneWidget);
    });

    testWidgets('renders CrewView', (tester) async {
      await tester.pumpApp(
        const CrewPage(),
        crewMemberRepository: crewMemberRepository,
      );

      expect(find.byType(CrewView), findsOneWidget);
    });
  });
}
