import 'package:bloc_test/bloc_test.dart';
import 'package:crew_member_repository/crew_member_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spacex_demo/crew/cubit/crew_cubit.dart';

import '../../helpers/helpers.dart';
import '../test_data.dart';

void main() {
  group('CrewCubit', () {
    late CrewMemberRepository crewMemberRepository;

    setUp(() {
      crewMemberRepository = MockCrewMemberRepository();
      when(() => crewMemberRepository.fetchAllCrewMembers())
          .thenAnswer((_) async => crewMembers);
    });

    test(
      'initial state is correct',
      () => {
        expect(
          CrewCubit(crewMemberRepository).state,
          equals(const CrewState()),
        )
      },
    );

    blocTest<CrewCubit, CrewState>(
      'emits state with updated crew members',
      build: () => CrewCubit(crewMemberRepository),
      act: (cubit) => cubit.fetchAllCrewMembers(),
      expect: () => [
        const CrewState(status: CrewStatus.loading),
        CrewState(
          status: CrewStatus.success,
          crewMembers: crewMembers,
        ),
      ],
    );

    blocTest<CrewCubit, CrewState>(
      'emits failure state when repository throws exception',
      build: () {
        when(() => crewMemberRepository.fetchAllCrewMembers())
            .thenThrow(Exception());
        return CrewCubit(crewMemberRepository);
      },
      act: (cubit) => cubit.fetchAllCrewMembers(),
      expect: () => [
        const CrewState(status: CrewStatus.loading),
        const CrewState(status: CrewStatus.failure, errorMessage: 'Exception'),
      ],
    );
  });
}
