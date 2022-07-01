import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_demo/crew_member_details/cubit/crew_member_details_cubit.dart';

import '../test_data.dart';

void main() {
  group('CrewMemberDetailsCubit', () {
    test('initial state is correct', () {
      expect(
        CrewMemberDetailsCubit(crewMember: crewMember).state,
        equals(const CrewMemberDetailsState(crewMember: crewMember)),
      );
    });
  });
}
