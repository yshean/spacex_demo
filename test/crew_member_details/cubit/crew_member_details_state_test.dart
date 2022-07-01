import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_demo/crew_member_details/cubit/crew_member_details_cubit.dart';

import '../test_data.dart';

void main() {
  group('CrewMemberDewtailsState', () {
    test('supports value comparison', () {
      expect(
        const CrewMemberDetailsState(crewMember: crewMember),
        const CrewMemberDetailsState(crewMember: crewMember),
      );
    });
  });
}
