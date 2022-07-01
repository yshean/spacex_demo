// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:crew_member_repository/crew_member_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_repository/rocket_repository.dart';
import 'package:spacex_demo/app/app.dart';

import '../../helpers/helpers.dart';

void main() {
  late CrewMemberRepository crewMemberRepository;
  late RocketRepository rocketRepository;

  setUp(() {
    crewMemberRepository = MockCrewMemberRepository();
    rocketRepository = MockRocketRepository();
  });

  group('App', () {
    testWidgets('renders AppView', (tester) async {
      await tester.pumpWidget(
        App(
          crewMemberRepository: crewMemberRepository,
          rocketRepository: rocketRepository,
        ),
      );
      expect(find.byType(AppView), findsOneWidget);
    });
  });

  group('AppView', () {
    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(
        App(
          crewMemberRepository: crewMemberRepository,
          rocketRepository: rocketRepository,
        ),
      );
      expect(find.byType(AppView), findsOneWidget);
    });
  });
}
